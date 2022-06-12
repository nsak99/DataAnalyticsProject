data {
   int N;
   real sugars[N];
}

generated quantities {
   real alpha = normal_rng(107, 20);
   real beta = normal_rng(0, 10);
   real sigma = exponential_rng(0.01);
   real calorie[N];
   for (i in 1:N) {
      calorie[i] = normal_rng(sugars[i]*beta+alpha, sigma);
   }

}