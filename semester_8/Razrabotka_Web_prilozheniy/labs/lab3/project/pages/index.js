import React from 'react';
import Head from 'next/head';
import Link from 'next/link';
import AwesomeSlider from 'react-awesome-slider';
import 'react-awesome-slider/dist/styles.css';
import styles from '../styles/Home.module.css';

function sendEmail(email) {
  const body = `Здравствуйте, я нашел вашего питомца.%0AС уважением, ${localStorage.user}`;
  window.open(`mailto:${email}?subject=Потерянный зверь&body=${body}`);
}

function Animal({ data }) {
  if (!data) {
    return null;
  }

  return (
    <div>
      <h1>{data.header}</h1>
      <h2>{data.content}</h2>
      <img src={data.img} width="600" alt={data.header} />
    </div>
  );
}

export default function Home() {
  const [animals, setAnimals] = React.useState([]);
  const [userName, setUserName] = React.useState('');

  // Animal loading
  React.useEffect(() => {
    fetch('/animals.json')
      .then((res) => res.json())
      .then(setAnimals);
  }, []);

  // Get user name
  React.useEffect(() => {
    let user = localStorage.getItem('user');
    if (!user) {
      user = prompt('Введите ваше имя пользователя');
      if (user) {
        localStorage.setItem('user', user);
        setUserName(user);
      }
    } else {
      setUserName(user);
    }
  }, []);

  const logout = () => {
    localStorage.clear();
    location.reload();
  };

  return (
    <div className={styles.container}>
      <Head>
        <title>Petto</title>
        <meta name="description" content="Социальная сеть для питомцев" />
        <link rel="icon" href="/favicon.ico" />
      </Head>

      <main className={styles.main}>
        {/* Top panel */}
        <div className={styles.topBar}>
          <div className={styles.userInfo}>
            <span>👤</span>
            <span className={styles.userName}>{userName || 'Гость'}</span>
          </div>
          <div className={styles.navLinks}>
            <Link href="/communities" passHref legacyBehavior>
              <a className={styles.navLink}>Сообщества</a>
            </Link>
            <Link href="/map" passHref legacyBehavior>
              <a className={styles.navLink}>Карта</a>
            </Link>
            <button onClick={logout} className={styles.logoutButton}>
              Выйти
            </button>
          </div>
        </div>

        <h1 className={styles.title}>Petto</h1>

        <div className={styles.sliderContainer}>
          <AwesomeSlider>
            {animals.map((data, i) => (
              <div key={i} onClick={() => sendEmail(data.email)}>
                <Animal data={data} />
              </div>
            ))}
          </AwesomeSlider>
        </div>
      </main>

      <footer className={styles.footer}>Petto, Belyaev Demin Sergunov</footer>
    </div>
  );
}