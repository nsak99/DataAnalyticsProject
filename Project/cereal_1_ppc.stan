generated quantities {
   real mu = normal_rng(107, 20);
   real sigma = exponential_rng(0.01);
   real calories = normal_rng(mu, sigma);
}