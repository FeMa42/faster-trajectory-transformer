from trajectory.datasets.get_d4rl import d4rl_dataset
from trajectory.utils.env import create_env

env_name = "halfcheetah-medium-v2"
env = create_env(env_name)
dataset = d4rl_dataset(env)
