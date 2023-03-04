# (Legacy) Install OpenAI Gym

This is Legacy documentation regarding OpenAI Gym installations. Updated Gymnasium installation at: [Install Gymnasium](install-gymnasium.md)

Official page: [link](https://gym.openai.com).
Official install: [link](https://github.com/openai/gym#installation) and [link](https://gym.openai.com/docs/#installation).

## Install OpenAI Gym (Ubuntu)

```bash
sudo -H pip install gym
```

### Enable Box2D Simulations
You'll need [pybox2d](https://github.com/pybox2d/pybox2d) for the [Box2D Simulations](https://gym.openai.com/envs/#box2d). Gym `0.10.11` works well with Box2D `2.3.2`. On Ubuntu 16.04 Xenial, as seen [here](https://launchpad.net/ubuntu/+source/python-box2d), you'll get a lower version via `apt` package. Thus, better to install via `pip`:
- [Install SWIG](install-swig.md)
```bash
sudo -H pip install Box2D
```

### Enable Atari Simulations
You'll need this for the [Atari Simulations](https://gym.openai.com/envs/#atari).
```bash
sudo -H pip install gym[atari]
```

### Enable MuJoCo and Robotics Simulations
You'll need this for the [MuJoCo Simulations](https://gym.openai.com/envs/#mujoco) and [Robotics Simulations](https://gym.openai.com/envs/#robotics). Link: https://github.com/openai/mujoco-py/

### Enable PyBullet Simulations
The downside to MuJoCo and Robotics are the license issues. However, you can get simulations that are very similar at <https://github.com/openai/gym/blob/master/docs/environments.md#pybullet-robotics-environments>. Installation should be straightforward, obtaining `pybullet_envs` rather effortlessly:
```bash
sudo -H pip install pybullet
```
