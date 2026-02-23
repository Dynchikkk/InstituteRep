import React from 'react';
import Head from 'next/head';
import styles from '../styles/Communities.module.css';

export default function Communities() {
  const [communities, setCommunities] = React.useState([]);

  const [comName, setName] = React.useState('');
  const [comDesc, setDesc] = React.useState('');
  const [comAvatar, setAvatar] = React.useState(null);
  const [comAvatarPreview, setAvatarPreview] = React.useState(null);

  React.useEffect(() => {
    const data = localStorage.getItem('communities');
    if (data) {
        setCommunities(JSON.parse(data));
    }
  }, []);

  const handleAvatarChange = (e) => {
    const file = e.target.files[0];
    if (!file) {
        return;
    }

    const reader = new FileReader();
    reader.onloadend = () => {
      setAvatar(reader.result);
      setAvatarPreview(reader.result);
    };
    reader.readAsDataURL(file);
  };

  const addCommunity = () => {
    if (!comName || !comDesc) {
      alert('Заполните название и описание');
      return;
    }

    const newCommunity = { name: comName, desc: comDesc, avatar: comAvatar || null };
    const updated = [...communities, newCommunity];
    setCommunities(updated);
    localStorage.setItem('communities', JSON.stringify(updated));

    setName('');
    setDesc('');
    setAvatar(null);
    setAvatarPreview(null);
  };

  const deleteCommunity = (index) => {
    const updated = communities.filter((_, i) => i !== index);
    setCommunities(updated);
    localStorage.setItem('communities', JSON.stringify(updated));
  };

  return (
    <div className={styles.container}>
      <Head>
        <title>Мои сообщества</title>
      </Head>

      <h1 className={styles.title}>Мои сообщества</h1>

      <div className={styles.form}>
        <input
          type="text"
          placeholder="Название сообщества"
          value={comName}
          onChange={(e) => setName(e.target.value)}
          className={styles.input}
        />
        <input
          type="text"
          placeholder="Описание"
          value={comDesc}
          onChange={(e) => setDesc(e.target.value)}
          className={styles.input}
        />

        <input
          type="file"
          accept="image/*"
          onChange={handleAvatarChange}
          className={styles.fileInput}
        />
        {comAvatarPreview && (
          <img src={comAvatarPreview} alt="preview" className={styles.preview} />
        )}

        <button onClick={addCommunity} className={styles.button}>
          Создать сообщество
        </button>
      </div>

      <div className={styles.communitiesList}>
        {communities.length === 0 ? (
          <p>Пока нет сообществ. Создайте первое!</p>
        ) : (
          communities.map((c, i) => (
            <div key={i} className={styles.communityCard}>
              {c.avatar ? (
                <img src={c.avatar} alt="avatar" className={styles.avatar} />
              ) : (
                <div className={styles.avatarPlaceholder}>?</div>
              )}
              <div className={styles.communityInfo}>
                <h3 className={styles.communityName}>{c.name}</h3>
                <p className={styles.communityDesc}>{c.desc}</p>
              </div>
              <button
                onClick={() => deleteCommunity(i)}
                className={styles.deleteButton}
              >
                Удалить
              </button>
            </div>
          ))
        )}
      </div>
    </div>
  );
}