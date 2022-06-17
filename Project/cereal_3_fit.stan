data {
   int N;
   vector[N] sugars;
   vector[N] calories;
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
   alpha ~ double_exponential(104, 14);
   beta ~ lognormal(0, 1);
   sigma ~ exponential(0.071);
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