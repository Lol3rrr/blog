<template>
  <div class="content">
    <blog-title>Tunneload - Part 0</blog-title>

    <div class="body">
      <div>
        <sub-title>The Concept</sub-title>
        <p class="sub-content">
          Tunneload aims to be a versitily, easy to use and performance and
          cloud-oriented Load-Balancer. <br />
          Okay so after this instance of Buzzword Bingo, we can move on to the
          actually informative Part of the Post
        </p>
      </div>
      <div>
        <sub-title>The Motivation behind it</sub-title>
        <p>
          You might ask yourself,
          <highlighted
            >"Why would you want to write and maintain your own Load-Balancer
            when there are already battle-tested and good options out
            there?"</highlighted
          >
          and you would be very right to ask that, BUT I would argue that it is
          always good to know and learn about different Parts of a System and
          given how prevelant Load-Balancers are in todays World, that's a great
          Point to start at. <br />
          Oh and also I faced some unique Challenges with my Homelab setup,
          which lent themselves perfectly to creating my own solution that
          perfectly solves my current Problems and it may even help others.
        </p>
      </div>
      <div>
        <sub-title>The Idea</sub-title>
        <p>
          Okay so previously I was using <highlighted>Traefik</highlighted> as
          my Load-Balancer and Entrypoint for all of my Services running on my
          Server at home. <br />
          However because I host everything at home, there are some unique
          challenges that come with that, with the most prevelant being the
          Question of
          <highlighted>
            "How do I get the Requests from the Internet correctly forwarded to
            my Server?" </highlighted
          >. <br />
          For this purpose I already wrote some custom Software previously,
          called
          <highlighted>Tunneler</highlighted> and the core functionality of it
          <highlighted>Tunneler-Core</highlighted>, which allow me to easily and
          dynamically forward all types of Connections from an external Server
          to my internal Servers. <br />
          To improve performance and make my whole Setup a bit less complex, I
          decided to write my own Load-Balancer, to replace Traefik, that could
          directly integrate with my
          <highlighted>Tunneler</highlighted> Software for better performance
          and versitily.
        </p>
      </div>
      <div>
        <sub-title>The Goal</sub-title>
        <p>
          Because I needed certain functionality that I relied on from Traefik,
          so that needed to be in my Load-Balancer as well and after some time I
          put together a simple list of features I needed in it.
          <br />
          The List consisted of the following items:
        </p>
        <ul>
          <li><p>Receive HTTP Requests over my Tunneler-Software</p></li>
          <li><p>Receive HTTP Requests from direct Connections</p></li>
          <li>
            <p>
              Route Requests to different Backend-Services based on different
              Criteria
            </p>
          </li>
          <li>
            <p>
              Modify Requests/Responses before forwarding them with different
              Middlewares
            </p>
          </li>
          <li>
            <p>
              Dynamically load and update the Configuration from Kubernetes and
              some other sources
            </p>
          </li>
          <li><p>Track some basic Metrics for better observability</p></li>
        </ul>
      </div>
      <div>
        <sub-title>Structure</sub-title>
        <ul>
          <li>
            <p>
              <highlighted>Configurator</highlighted>: These are used to
              actually load a specific Configuration from some form of
              Configuration Ressource, like a File or Kubernetes
            </p>
          </li>
          <li>
            <p>
              <highlighted>Acceptor</highlighted>: These are responsible for
              accepting Client Connections and provide a powerful abstraction
              over the actual underlying Connection-Type. This allows the rest
              of the Code to ignore how the Data is actually received or sent.
            </p>
          </li>
          <li>
            <p>
              <highlighted>Handler</highlighted>: As the name suggests this
              basically puts everything together and receives the requests,
              handles and forwards it correctly and then replies with the
              response
            </p>
          </li>
          <li>
            <p>
              <highlighted>Forwarder</highlighted>: This part is used by the
              Handler to offload some forwarding logic and takes over the
              responsiblity of establishing the connection going to the target
              backend service.
            </p>
          </li>
          <li>
            <p>
              <highlighted>Rule</highlighted>: This represents a single
              Rule/Route configured, which includes a set of Matchers,
              Middlewares and a single Service
            </p>
          </li>
          <li>
            <p>
              <highlighted>Matcher</highlighted>: These are used to actually
              determine if a Request Matches certain requirements
            </p>
          </li>
          <li>
            <p>
              <highlighted>Middleware</highlighted>: These are used to apply
              different Mutations to Requests or Responses to add extra
              functionality, like compressing response Data or allowing for easy
              TLS or CORS configuration by enabling them.
            </p>
          </li>
          <li>
            <p>
              <highlighted>Service</highlighted>: These represent the backing
              Addresses related to a specific Backend-Service
            </p>
          </li>
        </ul>
      </div>
      <div>
        <sub-title>Going Forward</sub-title>
        <p>
          Now that we know what we want, there is still the big question of
          <highlighted
            >"How will we actually go about implementing all that?"</highlighted
          >. This will be answered in this small Series of Posts that cover the
          development of Tunneload.
        </p>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import BlogTitle from '@/components/title.vue'
import SubTitle from '@/components/subtitle.vue'
import Highlighted from '@/components/highlight.vue'

export default Vue.extend({
  components: {
    BlogTitle,
    SubTitle,
    Highlighted,
  },
  layout: 'blog',

  head: {
    title: 'Tunneload - Part 0',
    meta: [
      {
        hid: 'description',
        name: 'description',
        content:
          "The first introduction Post for my own Load-Balancer 'Tunneload'",
      },
    ],
  },
})
</script>
<style></style>
