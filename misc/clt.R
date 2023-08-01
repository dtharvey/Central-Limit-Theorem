# binomial distribution
set.seed(13)
x = seq(1,10,1)
y = dbinom(x = x, size = 5, prob = 0.8)
plot(x,y, type = "l")

d = rbinom(n = 1000, size =  5, prob = 0.8)
dt = table(d)
barplot(dt)


d2 = rep(mean(sample(d,2)),1000)
hist(d2)

sample_binom = function(navg = 2, n = 1000, size = 5, prob = 0.8){
  
  d = rbinom(n = n, size = size, prob = prob)
  davg = rep(0,n)
  for (i in 1:n){
    davg[i] = mean(sample(d,navg))
  }
  out = list("davg" = davg)
}

test = sample_binom()

old.par = par(mfrow = c(1,2))
barplot(table(d))
hist(test$davg)
par(old.par)


ds1 = rnorm(1000,10,2)
ds2 = rnorm(2000,30,5)
ds = c(ds1,ds2)


twopart = function(navg = 2, trials = 500){
  ds1 = rnorm(10000,10,2)
  ds2 = rnorm(20000,30,5)
  ds = c(ds1,ds2)
  davg = rep(0,trials)
  for (i in 1:trials){
    davg[i] = mean(sample(ds,navg))
  }
  hist(davg,breaks = 50)
  out = list("davg" = davg)
}
