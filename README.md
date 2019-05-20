# Kubernetes transport plugin for Chef Inspec Train

This plugin allows applications that rely on Train to communicate with the Kubernetes API.  For example, InSpec uses this to perform compliance checks against any resource in the Kubernetes API. Train plugins are managed by InSpec CLI.

## Usage

When used in combination with the [InSpec Kubernetes Resource Pack](https://github.com/bgeesaman/inspec-k8s) you can validate the spec of any Kubernetes resource you have access to:

```ruby
describe k8sobjects(api: 'v1', type: 'pods', namespace: 'default', labelSelector: 'run=nginx') do
  it { should exist }
  ...
end
```

```ruby
describe k8sobjects(api: 'v1', type: 'namespaces', labelSelector: 'myns=prod') do
  it { should exist }
  ...
end
```

```ruby
describe k8sobject(api: 'v1', type: 'pod', namespace: 'default', name: 'my-pod') do
  it { should exist }
  its('name') { should eq 'my-pod' }
  ...
end
```

## Preconditions

- InSpec 3 or later.
- Ruby 2.4+
- You have set the env var KUBECONFIG or have a valid ~/.kube/config


## Installation

Train plugins are distributed as gems.  You may choose to manage the gem yourself, but if you are an InSpec user, InSPec can handle it for you.

Simply run:

```
$ inspec plugin install train-kubernetes
```

Verify the plugin

```
$ inspec detect -t k8s://

== Platform Details

Name:      k8s
Families:  cloud, api
Release:   0.1.0
```

## Reporting Issues

Bugs, typos, limitations, and frustrations are welcome to be reported through the [GitHub issues page for the train-kubernetes project](https://github.com/bgeesaman/train-kubernetes/issues).

You may also ask questions in the #inspec channel of the Chef Community Slack team.  However, for an issue to get traction, please report it as a github issue.

### Development Process

If you wish to contribute to this plugin, please use the usual fork-branch-push-PR cycle.  All functional changes need new tests, and bugfixes are expected to include a new test that demonstrates the bug.

### Reference Information

[Plugin Development](https://github.com/inspec/train/blob/master/docs/dev/plugins.md) is documented on the `train` project on GitHub.
