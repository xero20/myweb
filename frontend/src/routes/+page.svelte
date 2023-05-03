<script>
    import { Select, Button, ImagePlaceholder } from "flowbite-svelte";
    //import { Button } from "@edde746/flowbite-svelte";
    // flowbite datepicker
    let fyear;
    let fmonth;
    let fday;

    let uyear;
    let umonth;
    let uday;

    let year = [
        { value: "2015", name: "2015" },
        { value: "2016", name: "2016" },
        { value: "2017", name: "2017" },
        { value: "2018", name: "2018" },
        { value: "2019", name: "2019" },
        { value: "2020", name: "2020" },
    ];
    let month = [
        { value: "1", name: "1" },
        { value: "2", name: "2" },
        { value: "3", name: "3" },
        { value: "4", name: "4" },
        { value: "5", name: "5" },
        { value: "6", name: "6" },
        { value: "7", name: "7" },
        { value: "8", name: "8" },
        { value: "9", name: "9" },
        { value: "10", name: "10" },
        { value: "11", name: "11" },
        { value: "12", name: "12" },
    ];

    let day = [
        { value: "1", name: "1" },
        { value: "2", name: "2" },
        { value: "3", name: "3" },
        { value: "4", name: "4" },
        { value: "5", name: "5" },
        { value: "6", name: "6" },
        { value: "7", name: "7" },
        { value: "8", name: "8" },
        { value: "9", name: "9" },
        { value: "10", name: "10" },
        { value: "11", name: "11" },
        { value: "12", name: "12" },
        { value: "13", name: "13" },
        { value: "14", name: "14" },
        { value: "15", name: "15" },
        { value: "16", name: "16" },
        { value: "17", name: "17" },
        { value: "18", name: "18" },
        { value: "19", name: "19" },
        { value: "20", name: "20" },
        { value: "21", name: "21" },
        { value: "22", name: "22" },
        { value: "23", name: "23" },
        { value: "24", name: "24" },
        { value: "25", name: "25" },
        { value: "26", name: "26" },
        { value: "27", name: "27" },
        { value: "28", name: "28" },
        { value: "29", name: "29" },
        { value: "30", name: "30" },
        { value: "31", name: "31" },
    ];
</script>

<div class="mx-4 pb-5 text-center">
    <div class="flex items-center gap-3">
        <p class="font-mono text-xl">From:</p>
        <Select
            class="mx-2.5"
            placeholder="Year"
            items={year}
            bind:value={fyear}
        />
        <Select placeholder="Month" items={month} bind:value={fmonth} />
        <Select placeholder="Day" items={day} bind:value={fday} />
    </div>
    <div class="mt-4 flex items-center gap-3">
        <p class="font-mono text-xl">Until:</p>
        <Select placeholder="Year" items={year} bind:value={uyear} />
        <Select placeholder="Month" items={month} bind:value={umonth} />
        <Select placeholder="Day" items={day} bind:value={uday} />
    </div>

    <div class="mt-4 items-center">
        <Button gradient color="greenToBlue">Enter</Button>
        <!--
        <Button outline={true} gradientDuoTone="greenToBlue">Enter</Button>
        -->
        <!--redtoCyan-->
    </div>
    <div
        class="mt-10
        sm:px-20 md:px-32 lg:px-40 xl:px-52 2xl:px-60
    items-center"
    >
        <ImagePlaceholder class="h-screen" />
        <!--
        <img src="example_image.svg" class="h-screen" alt="example_image" />
        -->
    </div>
</div>
