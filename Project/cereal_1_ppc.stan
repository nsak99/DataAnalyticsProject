generated quantities {
   real mu = normal_rng(104, 14);
   real sigma = exponential_rng(0.071);
   real calories = normal_rng(mu, sigma);
}