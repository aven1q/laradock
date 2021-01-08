### How to keep your Git-Fork up to date

1. Add the upstream

```
git remote add upstream git://github.com/Laradock/laradock.git
```

2. Check remote URLs:

```
git remote -v
```

If you now have a look at your remote URLs, you should see the following:

```
origin  https://github.com/aven1q/limsdock.git (fetch)
origin  https://github.com/aven1q/limsdock.git (push)
upstream        git://github.com/Laradock/laradock.git (fetch)
upstream        git://github.com/Laradock/laradock.git (push)
```

3. Keep the upstream updated

Now as we have both URLs get tracked, we can update the two sources independently. With

```
git fetch upstream
```

4. Merge the upstream with your fork

```
git merge upstream/master master
```

#### Tips

The best way in my eyes is, to rebase because that fetches the latest changes of the upstream branch and replay your work on top of that. Here is, how it works:

```
git rebase upstream/master
```
