<template>
  <v-layout justify-start align-center column>
    <v-toolbar color="#01C5B9">
      <v-toolbar-title>Abandoned Games Database</v-toolbar-title>
      <v-autocomplete
        :loading="loading"
        :items="items"
        :search-input.sync="search"
        v-model="select"
        cache-items
        class="mx-3"
        flat
        hide-no-data
        hide-details
        label="What old game are you looking for?"
        solo-inverted
      ></v-autocomplete>
    </v-toolbar>
    <v-data-table
      :headers="headers"
      :items="abandonWare"
      dark
      class="elevation-1 mt-5"
    >
      <template slot="items" slot-scope="props">
        <td class="text-xs-right">{{ props.item.title }}</td>
        <td class="text-xs-right">{{ props.item.releaseDate }}</td>
        <td class="text-xs-right">{{ props.item.license }}</td>
        <td class="text-xs-right">{{ props.item.openSource }}</td>
        <td class="text-xs-right">{{ props.item.publisher }}</td>
        <td class="text-xs-right">{{ props.item.contact }}</td>
        <td class="text-xs-right">{{ props.item.active }}</td>
        <td class="text-xs-right">{{ props.item.genre }}</td>
      </template>
    </v-data-table>
  </v-layout>
</template>

<script>
export default {
  data() {
    return {
      headers: [
        {
          text: 'Title',
          align: 'left',
          sortable: false,
          value: 'title',
        },
        { text: 'Release Date', value: 'releaseDate' },
        { text: 'License', value: 'license' },
        { text: 'Open Source', value: 'openSource' },
        { text: 'Publisher', value: 'publisher' },
        { text: 'Contact', value: 'contact' },
        { text: 'Active', value: 'active' },
        { text: 'Genre', value: 'genre' },
      ],
      abandonWare: [
        {
          title: 'Kings Quest I',
          releaseDate: 'July 1983',
          license: 'Proprietary',
          openSource: 'False',
          publisher: 'Sierra',
          contact: 'Unknown',
          active: 'False',
          genre: 'Adventure',
        },
        {
          title: 'Kings Quest II',
          releaseDate: 'July 1983',
          license: 'Proprietary',
          openSource: 'False',
          publisher: 'Sierra',
          contact: 'Unknown',
          active: 'False',
          genre: 'Adventure',
        },
        {
          title: 'Kings Quest III',
          releaseDate: 'July 1983',
          license: 'Proprietary',
          openSource: 'False',
          publisher: 'Sierra',
          contact: 'Unknown',
          active: 'False',
          genre: 'Adventure',
        },
        {
          title: 'Kings Quest IV',
          releaseDate: 'July 1983',
          license: 'Proprietary',
          openSource: 'False',
          publisher: 'Sierra',
          contact: 'Unknown',
          active: 'False',
          genre: 'Adventure',
        },
        {
          title: 'Kings Quest V',
          releaseDate: 'July 1983',
          license: 'Proprietary',
          openSource: 'False',
          publisher: 'Sierra',
          contact: 'Unknown',
          active: 'False',
          genre: 'Adventure',
        },
        {
          title: 'Kings Quest VI',
          releaseDate: 'July 1983',
          license: 'Proprietary',
          openSource: 'False',
          publisher: 'Sierra',
          contact: 'Unknown',
          active: 'False',
          genre: 'Adventure',
        },
      ],
    };
  },
};
</script>

<style scoped lang="scss">

</style>
