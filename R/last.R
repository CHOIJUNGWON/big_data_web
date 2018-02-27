#필요한 패키지 로딩
libs<- c('ggplot2','ggmap','jsonlite')
unlist(lapply(libs, require, character.only=TRUE))
#자료읽어오기
subway<-read.csv('c:/easy_r/subway.csv',header =TRUE, stringsAsFactors = FALSE, fileEncoding = 'UTF-8')
str(subway)

#as.Date함수를 이용해 날짜를 표준서식으로 변환,unique()를 이용해 기록된 자료를 중복없이 출
class(subway[,'income_date'])<-'character'
subway[,'income_date']<-as.Date(subway[,'income_date'],format='%Y%m%d')
unique(format(subway[,'income_date'],'%Y'))

#2014년 제외 자료를 데이터 프레임 subway2이름으로 저장
idx<-format(subway[,'income_date'],'%Y')=='2014'
unique(format(subway[,'income_date'],'%m'))
subway2<-subset(subway,subset = format(income_date,'%Y')!='2014')

sort(unique(subway[,'stat_name']))

#노선번호가 붙은 행을 grep()을 이용해 찾고 strsplit을 이용해 역명, 노선번호를 분리하여 노선번호가 붙지 않는 역명으로 대체
idx<-grep("\\(",subway2[,'stat_name'])
unique(subway2[idx,'stat_name'])

stat_name<-subway2[,'stat_name']
tmp<-sapply(subway2[idx,'stat_name'],strsplit,'\\(',USE.NAMES=FALSE)
stat_renamed<-sapply(tmp, function(x) x[1])
subway2[idx,'stat_name']<-stat_renamed

#분석의 편의를 위해 새로운 변수로 정의
year<-format(subway2[,'income_date'],"%Y")
month<-format(subway2[,'income_date'],"%m")
subway2<-cbind(subway2, year ,month)

#csv파일 읽기
subname<-read.csv('c:/easy_r/subway_latlong.csv',header =TRUE, stringsAsFactors = FALSE,skip=1, fileEncoding = 'UTF-8')
str(subname)
head(sort(unique(subname[,'STATION_NM'])), 10)

#노선 역명을 line이름의 리스트 객체에 저장해 분석에 활용
Line<-tapply(subname[,'STATION_NM'],subname[,'LINE_NUM'],unique)
sapply(Line,head)
#연도별, 역별 지하철 탑승객 수의 계산
#역별 특정 연도의 탑승객 수 합산 함수 정의
agg_fun<-function(vec, adt){
  sub_Line<-dat[dat[,'stat_name']%in%vec,]
  tot<-aggregate(on_tot~year+stat_name,sub_Line, sum)
  return(tot)
}
#데이터프레임 저장, xtabs()는 세로로 긴 프레임 total을 가로,세로에 year의 각 수준으로 나타내는 테이블을 만들어 출력
total<-lapply(Line[1:8], FUN=agg_fun, dat=subway2)
df1<-lapply(total, xtabs,formula=on_tot~stat_name+year)
lapply(df1,head)

#각 지하철역의 4개년도 누적 탑승객 수 계산
#lapply(),xtabs를 이용해 탑승객 수를 계산해 리스트에 저장후 이름 변형
cum_total<-lapplu(total,xlabs,formula=on_tat~stat_name)
cum_total_vec<-unlist(com_total)
names(cum_total_vec)<-unlist(lapply(strsplit(names(cum_total_vec),'\\.')))
function(x) x[2]
file_num<-factor(rep(1:8,lapply(cum_total_length)),labels=paste0(1:8,'호선'))
df2<-data.frame(stat_names(cum_total_vec),line_num=line_num,on_tot=cum_total_vec,stringsAsFactors=FALSE)
df2$stat_name<-factor(df$stat_name,levels=df$stat_name)

#ggplot을 이용해 결과를 막대그래프로 시각화,각종 옵션지정

plt<-ggplot(df2,aes(x=stat_name,y=on_tot,fill=line_num))
plt+theme_bw()+geom_bar(stat='identity',colour='white')+scale_x_discrete('지하철역',labels=NULL)+ylab('탑승객수')+scale_fill_discrete(name=c('노선'))

#상위 10개역 추출, 탑승객 수를 막대그래프로 시각화
#탑승객 기준 상위10개역을 찾아 대응하는 인덱스를 저장후 구현
idx_top10<-cum_total_vec>=sort(cum_total_vec,decreasing=TRUE)[10]
cum_total_vec[idx_top10]
df3<-subset(df2, subset=idx_top10)
lim<-c(0,max(df2$on_tot))
plt<-ggplot(df3,aes(stat_name,y=on_tot,fill=line_num))
plt+theme_bw()+geom_bar(stat='identity',colour='white')+xlab('지하철역',labels=NULL)+scale_y_continuous('탑승객수',lim=lim)+scale_fill_discrete(name=c('노선'))
#하위 10개 역추출
idx_bot10<-cum_total_vec<=sort(cum_total_vec,decreasing=FALSE)[10]
cum_total_vec[idx_bot10]
df4<-subset(df2, subset=idx_bot10)
plt<-ggplot(df4,aes(stat_name,y=on_tot,fill=line_num))
plt+geom_bar(stat='identity',colour='white')+xlab('하위10개 지하철역')+scale_y_continuous('탑승객수',lim=lim)+scale_fill_discrete(name=c('노선'))

#2013년 상위 10개 역 월별 탑승객추이
stat_top10_2013<-subset(subway2,subset=stat_name%in%names(cum_total_vec[idx_top10])&year=='2013',select=c('stat_name','on_tot','month'))
stat_top10_2013<-aggregate(on_tot~month+stat_name,stat_top10_2013,sum)

#생성된 stat_top10_2013을 선그래프로 나타냄
plt <- ggplot(stat_top10_2013, aes(x=month, y=on_tot, colour=stat_name, group=stat_name)) 
plt <- plt + theme_classic() + geom_line() + geom_point(size=6, shape=19, alpha=0.5) 
plt + scale_x_discrete("2013년", labels=paste0(unique(as.numeric(month)), 
                                              "월")) + ylab("월별 탑승객수") + scale_colour_discrete(name=c("지하철역"))

#하위 10개역 월별 탑승객 추이 시각화
stat_bot10_2013 <- subset(subway2, subset = stat_name %in% names(cum_total_vec[idx_bot10]) & year=="2013", select=c("stat_name", "on_tot", "month")) 
stat_bot10_2013 <- aggregate(on_tot ~ month + stat_name, stat_bot10_2013, sum) 

plt <- ggplot(stat_bot10_2013, aes(x=month, y=on_tot, colour=stat_name, group=stat_name)) 
plt <- plt + theme_classic() + geom_line() + geom_point(size=6, shape=19, alpha=0.5) 
plt + scale_x_discrete("2013년", labels=paste0(unique(as.numeric(month)), "월")) 
+ ylab("월별 탑승객수") + scale_colour_discrete(name=c("지하철역"))

#노선별 역당 평균 탑승객 수의 계산 및 비교
#2개의 데이터프레임을 merge함수를 이용해 병합한후 이를 subway3으로 저장
#각 노선별 평균 탑승객 수를 계산하여 tmp2에 저장후 파이파트로 표현
subway3<-merge(subway2[])
