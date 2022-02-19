# iCal4j Examples - VCard

This page provides examples of using an iCal4j VCard model to generate VCard objects.

## Creating a simple vCard

    List<Property> props = new ArrayList<Property>();
    props.add(new Source(URI.create("ldap://ldap.example.com/cn=Babs%20Jensen,%20o=Babsco,%20c=US")));
    props.add(new Name("Babs Jensen's Contact Information"));
    props.add(Kind.INDIVIDUAL);
    // add a custom property..
    props.add(new Property("test") {
        @Override
        public String getValue() {
            return null;
        }

        @Override
        public void validate() throws ValidationException {
        }
    });

    VCard vcard = new VCard(props);

