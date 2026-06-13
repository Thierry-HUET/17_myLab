// fr-date.mjs
// Plugin MyST — reformate les dates ISO en français dans le frontmatter
// Utilise Intl.DateTimeFormat avec la locale fr-FR

const MOIS = [
  'janvier', 'février', 'mars', 'avril', 'mai', 'juin',
  'juillet', 'août', 'septembre', 'octobre', 'novembre', 'décembre'
];

function formatDateFr(isoString) {
  // isoString peut être "2026-06-13" ou un timestamp en ms (number)
  const d = new Date(isoString);
  if (isNaN(d.getTime())) return isoString;
  // Forcer l'interprétation en UTC pour éviter les décalages de fuseau
  const day   = d.getUTCDate();
  const month = MOIS[d.getUTCMonth()];
  const year  = d.getUTCFullYear();
  return `${day} ${month} ${year}`;
}

const frDatePlugin = {
  name: 'fr-date',
  transforms: [
    {
      name: 'format-date-fr',
      doc: 'Reformate le champ date du frontmatter en français (ex : 13 juin 2026).',
      stage: 'document',
      plugin: (_, utils) => (tree, file) => {
        // Le frontmatter est exposé dans file.result ou file.data selon la version MyST
        const fm = file?.result?.frontmatter ?? file?.data?.frontmatter;
        if (fm && fm.date) {
          fm.date = formatDateFr(fm.date);
        }
        // Parcourt aussi les nœuds de type 'date' si présents dans l'AST
        utils.selectAll('date', tree).forEach((node) => {
          if (node.value) {
            node.value = formatDateFr(node.value);
          }
        });
      },
    },
  ],
};

export default frDatePlugin;
