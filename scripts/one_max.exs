defmodule OneMax do
  @behaviour Problem

  alias Types.Chromosome

  @impl true
  def genotype do
    genes = for _ <- 1..42, do: Enum.random(0..1)
    %Chromosome{genes: genes, size: 42}
  end

  @impl true
  def fitness_function(chromosome), do: Enum.sum(chromosome.genes)

  @impl true
  def terminate?(_population, _generation, temperature), do: temperature < 1

  # @impl true
  # def terminate?(population), do: hd(population).fitness == 42

  # Maximum Fitness Threshold
  # @impl true
  # def terminate?(population) do
  #   Enum.max_by(population, &OneMax.fitness_function/1).fitness == 42
  # end

  # Minimum Fitness Threshold
  # @impl true
  # def terminate?(population) do
  #   Enum.min_by(population, &OneMax.fitness_function/1).fitness == 0
  # end
end

solution = Genetics.run(OneMax, cooling_rate: 0.01)

IO.write("\n")
IO.inspect(solution)
