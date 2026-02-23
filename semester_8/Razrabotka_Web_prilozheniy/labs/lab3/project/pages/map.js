import dynamic from "next/dynamic";
import styles from "../styles/Map.module.css";

const YMaps = dynamic(
  () => import("@pbe/react-yandex-maps").then(mod => mod.YMaps),
  { ssr: false }
);
const Map = dynamic(
  () => import("@pbe/react-yandex-maps").then(mod => mod.Map),
  { ssr: false }
);
const Placemark = dynamic(
  () => import("@pbe/react-yandex-maps").then(mod => mod.Placemark),
  { ssr: false }
);

export default function MapPage() {
  const coordinates = [53.182763, 45.000720];

  return (
    <div className={styles.container}>
      <h1 className={styles.title}>Карта</h1>

      <div className={styles.info}>
        <h2>Беляев Даниил</h2>
        <h2>Демин Максим</h2>
        <h2>Сергунов Максим</h2>
        <p>Группа 22ВВП1</p>
      </div>

      <div className={styles.mapWrapper}>
        <YMaps>
          <Map
            defaultState={{ center: coordinates, zoom: 14 }}
            width="100%"
            height="400px"
          >
            <Placemark geometry={coordinates} />
          </Map>
        </YMaps>
      </div>
    </div>
  );
}