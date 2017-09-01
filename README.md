# pry_into_warbler
Quick hack to make an interactive pry shell running inside a JRuby jar created via warbler

# What is this again?

I was trying to figure out some oddities when accessing file paths inside a out JRuby jar and wanted to be able to run an interactive `pry` shell from inside the jar and accessing files in the jar and compare to running the same commands when running the same code but *not* compiled into a jar. I wrote this quick hack and am publishing it in case anyone else cares - and so I can find it in the future.

# HOWTO

- clone the repo
- run `bundle install` # note that this assumes rvm and has `.ruby-version` you might want to hack at
- run `warble jar` to build the jar
- run `java -jar pry_into_warbler.jar` to execute in the jar
- OR run `ruby lib/pry_into_warbler.rb` to execute *not* from the jar

You can see the small amount of code in `lib/pry_into_warbler.rb`. It is just aimed at starting `pry` interactively and exposing a path to the 'public' path where some trivial content is located.


When run in the jar one might do:
```
[1] pry(#<PryIntoWarbler>)> rebase('base1.txt')
=> "uri:classloader:/pry_into_warbler/public/base1.txt"
[2] pry(#<PryIntoWarbler>)> File.exist? rebase('base1.txt')
=> true
```

When run outside the jar one might do:
```
[1] pry(#<PryIntoWarbler>)> rebase('base1.txt')
=> "/Users/jband/hacks/pry_into_warbler/public/base1.txt"
[2] pry(#<PryIntoWarbler>)> File.exist? rebase('base1.txt')
=> true
```

Note that the 'pry' startup when run in the jar complains a bit. I think that is just due to it not being about to find the file source because the config options I'm using compile the ruby code to classfiles. Or, maybe not.
