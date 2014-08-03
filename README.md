Comp Lions
==========

Lions have certain expectations.  Given their status as kings of the jungle, and being therefore used to eating whatever and whenever they choose, they bristle at the idea of paying for meals in restaurants.  This has led to tension between the lion community and restauranteurs, who (understandably) feel that some lions take unfair advantage of their menacing teeth and claws when requesting meal comps.  To make matters worse, each borough of New York has different lion laws, and servers find themselves intimidated when taking the time to correctly determine exactly how to fairly comp a lion for a meal.

No more!  Comp Lions (tm) provides a simple way to quickly calculate the appropriate comp level for a given class of service in a given location.  As an added bonus, it's a simple demonstration of using an LTree column on a PG table to aggregate hierarchical data.  To wit:

- Classifications are hierarchical: the `Burgers` classification may have the hierarchy `Burgers -> Fast Food -> Restaurant -> Food`
- Services have classifications; McDonald's may have the classification `Burgers`
- Comps associate a classification (at any level of the hierarchy) with a location, and specify a percentage.  For instance, lions may receive a 50% comp at services classified as `Burgers` in Manhattan
- Services calculate the appropriate comp for a specified location by selecting the largest percentage for the comp associated with the service's classification, or any parent classification.

Hurray!

