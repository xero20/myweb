<script>
  import {
    Navbar,
    NavBrand,
    NavLi,
    NavUl,
    NavHamburger,
  } from "flowbite-svelte";

  import "../app.postcss";
  import { page } from "$app/stores";
</script>

<header>
  <div
    class="container mx-auto
  2xl:px-0 xl:px-50 lg:px-40 md:px-30"
  >
    <Navbar let:hidden let:toggle>
      <NavBrand href="/">
        <img src="Logo.svg" class="mr-3 h-11" alt="Logo" />
        <span
          class="self-center whitespace-nowrap text-3xl font-semibold dark:text-white"
        >
          HowPM
        </span>
      </NavBrand>
      <NavHamburger on:click={toggle} />
      <NavUl {hidden}>
        <NavLi href="/" active={$page.url.pathname === "/"}>Home</NavLi>
        <NavLi href="/about" active={$page.url.pathname === "/about"}
          >About</NavLi
        >
      </NavUl>
    </Navbar>
  </div>
</header>

<main>
  <div
    class="container mx-auto
  md:px-30 lg:px-40 xl:px-50 2xl:px-60"
  >
    <slot />
  </div>
</main>

<footer>
  <hr />
  <div clsass="text-center">
    <span />
  </div>
</footer>
