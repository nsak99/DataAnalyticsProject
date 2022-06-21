generated quantities {
   real mu = normal_rng(105, 15);
   real sigma = exponential_rng(0.067);
   real calories = normal_rng(mu, sigma);
}