data {
   int N;
   vector[N] sugars;
   real calories[N];
}

parameters {
   real alpha;
   real beta;
   real<lower=0> sigma;
   real<lower=1, upper=80> nu;
}

transformed parameters {
   vector[N] mu = sugars*beta+alpha;
}

model {
   alpha ~ normal(107, 30);
   beta ~ lognormal(0, 1);
   sigma ~ exponential(0.01);
//    nu ~ gamma(50, 10);
   calories ~ double_exponential(mu, sigma);
}

generated quantities {
   vector[N] log_lik;
   real calorie[N];
   for (i in 1:N) {
      log_lik[i] = double_exponential_lpdf(calories[i] | mu[i], sigma);
      calorie[i] = double_exponential_rng(mu[i], sigma);
   }
}