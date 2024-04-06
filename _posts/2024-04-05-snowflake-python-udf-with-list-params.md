---
title: Snowflake Python UDF with List Params
tags: [python, snowflake]
permalink: /blog/snowflake-python-udf-with-list-params
blurb: "In case you wanted to pass a list to a Snowflake Python UDF"
description: "It's not entirely clear what Snowflake types to pass to a Python UDF that expects a List as a parameter. Here's how to do it."
metaname: Snowflake Python UDF with List Params
image: snowflake-python-udf-with-list-params/snowflake.png
---

This week at work, I was helping one of our data scientists mirror A/B test assignments made in our adserver logic in Snowflake. To do so, I needed to create a Snowflake user defined function (UDF) that implemented the same logic.

![Snowflake](/assets/img/snowflake-python-udf-with-list-params/snowflake.png)

I wanted them to be able to call the UDF in a simple way, defining the size of each test variant inline, rather than having to store the config in another table and then query it out. Something like this:

{% highlight sql %}
select data_science_experiment_assignment('hash_key', [["control", 20], ["treatment", 80]]);
{% endhighlight %}

Because of the way the hash ring was implemented in the adserver, I also knew I wanted the UDF to receive a Python `List` as a parameter, but I couldn't find Snowflake documentation that explicitly told me what Snowflake type would map to the Python type. After a little trial and error, I found that defining a list in the query above generates a `VARIANT`, that can then be mapped to a Python `List`.

Here's the UDF minus the implementation:

{% highlight sql %}
create or replace 
  function data_science_experiment_assignment(input string,  thresholds variant)
returns string
language python
runtime_version = 3.8
packages = ('python-xxhash==2.0.2')
handler = 'udf'
as
$$
from typing import List, Tuple
import xxhash

def udf(input: str, thresholds: List[Tuple[str, int]]) -> str:
    ...
$$;
{% endhighlight %}

If you're familiar with Python UDFs in Snowflake, this should look pretty straight forward. The main caveats are that the `packages` parameter lists the Python libraries to install, and the `handler` parameter is the name of the function we define in the Python code block.

Hopefully this helps someone out. If not, I'm sure I'll look back on this the next time I need to do something similar.
