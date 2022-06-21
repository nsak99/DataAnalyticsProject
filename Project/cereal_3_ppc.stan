data {
   int N;
   real sugars[N];
}

generated quantities {
   real alpha = double_exponential_rng(105, 15);
   real beta = lognormal_rng(0, 1);
   real sigma = exponential_rng(0.067);
   real calorie[N];
   for (i in 1:N) {
      calorie[i] = double_exponential_rng(sugars[i]*beta+alpha, sigma);
   }

}