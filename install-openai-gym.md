# Install OpenAI Gym

Official page: [link](https://gym.openai.com).
Official install: [link](https://github.com/openai/gym#installation) and [link](https://gym.openai.com/docs/#installation).

## Install OpenAI Gym (Ubuntu 16.04)

```bash
sudo -H pip install gym
```

### Enable Box2D Simulations
You'll need [pybox2d](https://github.com/pybox2d/pybox2d) for the [Box2D Simulations](https://gym.openai.com/envs/#box2d). Gym `0.10.11` works well with Box2D `2.3.2`. On Ubuntu 16.04 Xenial, as seen [here](https://launchpad.net/ubuntu/+source/python-box2d), you'll get a lower version via `apt` package. Thus, better to install via `pip`:
- [Install SWIG](install-swig.md)
```bash
sudo -H pip install Box2D
```
