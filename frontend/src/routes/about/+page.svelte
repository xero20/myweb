<script>
    import { Heading, AccordionItem, Accordion } from "flowbite-svelte";
</script>

<Heading tag="h2" customSize="text-4xl font-extrabold mx-10" class="font-mono"
    >HowPM</Heading
>

<div class="mt-6 mx-10 pb-5">
    <Accordion
        multiple
        activeClasses="bg-blue-100 dark:bg-gray-800 text-blue-600 dark:text-white focus:ring-4 focus:ring-blue-200 dark:focus:ring-blue-800"
        inactiveClasses="text-gray-500 dark:text-gray-400 hover:bg-blue-100 dark:hover:bg-gray-800"
    >
        <AccordionItem open>
            <span slot="header" class="font-mono text-xl"
                >What is this site for?</span
            >
            <p class="font-mono text-lg">
                This site visualizes the concentration of PM2.5 on a map.
            </p>
        </AccordionItem>
        <AccordionItem>
            <span slot="header" class="font-mono text-xl"
                >Why is this site needed?</span
            >
            <p class="font-mono text-lg">
                PM2.5 monitoring stations exist only in some regions, and even
                the number was small in the past, so the PM2.5 concentration in
                areas without monitoring stations cannot be accurately observed.
                Therefore, a machine learning model trained with climate,
                satellite, and terrain-related variables was used to estimate ()
                PM2.5 concentrations across Korea at a resolution of 1kmx1km
                grid. Using this model, it is possible to know the PM2.5
                concentration throughout Korea during a specific period, and it
                can be used in (various ways) by combining it with regional
                information such as cities, counties, and districts.
            </p>
        </AccordionItem>
        <AccordionItem>
            <span slot="header" class="font-mono text-xl">How to use?</span>
            <p class="font-mono text-lg">
                Enter the year, month, and day in the From column and Until
                column. You can then obtain a map image visualizing the average
                value of PM2.5 concentration over that period.
            </p>
        </AccordionItem>
        <AccordionItem>
            <span slot="header" class="font-mono text-xl"
                >Is this site all built?</span
            >
            <p class="font-mono text-lg">Not yet!</p>
        </AccordionItem>
    </Accordion>
</div>
