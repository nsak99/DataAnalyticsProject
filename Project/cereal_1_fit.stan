data {
   int N;
   real calories[N];
}

parameters {
   real mu;
   real<lower=0> sigma;
}

model {
   mu ~ normal(105, 15);
   sigma ~ exponential(0.067);
   calories ~ normal(mu, sigma);
}

generated quantities {
   real log_lik = normal_lpdf(calories | mu, sigma);
   real calorie = normal_rng(mu, sigma);
}