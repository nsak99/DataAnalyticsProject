data {
   int N;
   vector[N] sugars;
   real calories[N];
}

parameters {
   real alpha;
   real beta;
   real<lower=0> sigma;
}

transformed parameters {
   vector[N] mu = sugars*beta+alpha;
}

model {
   alpha ~ normal(105, 15);
   beta ~ lognormal(0, 1);
   sigma ~ exponential(0.067);
   calories ~ normal(mu, sigma);
}

generated quantities {
   vector[N] log_lik;
   real calorie[N];
   for (i in 1:N) {
      log_lik[i] = normal_lpdf(calories[i] | mu[i], sigma);
      calorie[i] = normal_rng(mu[i], sigma);
   }
}