Async and concurrency can be faked on a single CPU through the use of epicycles, but, epicycles cause gotchas (see Mars Pathfinder disaster, thread safety, etc.).

2 separate rPIs connected by a wire are parallel and are async.  Neither one needs faked concurrency nor faked async, but we program them that way anyway.

(See, also, [[2022-05-30-Fire and Forget]])