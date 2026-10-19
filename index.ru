<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Моя Школа 2.0 | Clean Aero</title>
    <style>
        /* --- СДЕРЖАННЫЙ СТИЛЬ (Clean Aero) --- */
        :root {
            --primary: #3b6999;
            --bg-glass: rgba(245, 248, 252, 0.85);
            --border-glass: rgba(200, 215, 230, 0.8);
            --text-main: #2c3e50;
            --text-muted: #607d8b;
        }

        body, html { 
            margin: 0; padding: 0; 
            font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif; 
            background: #e3ebf3;
            background-image: radial-gradient(circle at 10% 20%, rgba(255,255,255,0.8) 0%, rgba(220,235,245,0) 50%),
                              radial-gradient(circle at 90% 80%, rgba(210,230,245,0.6) 0%, rgba(220,235,245,0) 50%);
            background-attachment: fixed;
            font-size: 14px; color: var(--text-main); 
            min-height: 100vh;
        }
        * { box-sizing: border-box; }
        a { color: var(--primary); text-decoration: none; font-weight: 600; cursor: pointer; }
        
        .glass-panel {
            background: var(--bg-glass);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border: 1px solid var(--border-glass);
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            border-radius: 10px;
            margin-bottom: 15px;
            overflow: hidden;
        }

        .top-bar { 
            background: rgba(255,255,255,0.7); 
            backdrop-filter: blur(8px);
            border-bottom: 1px solid var(--border-glass); 
            padding: 10px 15px; 
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 13px;
        }
        
        .header { 
            background: linear-gradient(to bottom, #ffffff 0%, #e8f0f8 100%);
            color: var(--primary); 
            padding: 12px; 
            text-align: center; 
            font-size: 20px; 
            font-weight: 600; 
            border-bottom: 1px solid var(--border-glass);
            letter-spacing: 0.5px;
        }
        
        .auth-panel { 
            display: none; padding: 15px; text-align: center; 
            background: rgba(255,255,255,0.6);
            border-bottom: 1px solid var(--border-glass);
        }

        .form-input { 
            width: 100%; padding: 10px; 
            border: 1px solid #cbd5e1; 
            border-radius: 6px; 
            font-size: 13px; 
            margin-bottom: 8px;
            background: #fff;
            color: var(--text-main);
            transition: 0.2s;
        }
        .form-input:focus { outline: none; border-color: var(--primary); box-shadow: 0 0 0 2px rgba(59,105,153,0.1); }

        .btn { 
            padding: 10px 15px; 
            background: #4a7fa5;
            color: white; 
            border: none; 
            border-radius: 6px; 
            font-weight: 500; 
            font-size: 14px; 
            cursor: pointer; 
            width: 100%;
            transition: 0.2s;
        }
        .btn:hover { background: #3b6999; }
        .btn:disabled { background: #cbd5e1; cursor: not-allowed; }
        .btn-danger { background: #c0392b; }
        .btn-danger:hover { background: #a93226; }

        .nav-tabs { 
            background: rgba(255,255,255,0.7); 
            backdrop-filter: blur(8px);
            border-bottom: 1px solid var(--border-glass); 
            position: sticky; top: 0; z-index: 100; 
            display: flex; 
            overflow-x: auto;
        }
        .nav-tab { 
            flex: 1; padding: 12px 10px; 
            font-size: 13px; font-weight: 500; 
            color: var(--text-muted); cursor: pointer; 
            border-bottom: 2px solid transparent; 
            text-align: center; white-space: nowrap;
        }
        .nav-tab.active { color: var(--primary); border-bottom: 2px solid var(--primary); background: rgba(255,255,255,0.9); }

        .container { width: 100%; max-width: 600px; margin: 0 auto; padding: 10px; }
        .screen { display: none; }
        .screen.active { display: block; }

        .block-title { 
            background: rgba(235, 242, 248, 0.8);
            color: var(--primary); 
            padding: 10px 15px; 
            font-size: 14px; font-weight: 600; 
            border-bottom: 1px solid var(--border-glass);
        }
        .block-content { padding: 15px; }

        /* Посты */
        .post { border-bottom: 1px solid rgba(0,0,0,0.06); padding-bottom: 12px; margin-bottom: 12px; position: relative; }
        .post:last-child { border-bottom: none; margin-bottom: 0; padding-bottom: 0; }
        .post-header { font-weight: 600; font-size: 14px; color: var(--primary); margin-bottom: 6px; display: flex; align-items: center; gap: 8px; }
        .post-avatar { width: 32px; height: 32px; border-radius: 50%; object-fit: cover; border: 1px solid #ddd; cursor: pointer; }
        .post-text { font-size: 14px; line-height: 1.4; margin-bottom: 8px; word-break: break-word; }
        .post-img { max-width: 100%; border-radius: 6px; border: 1px solid #eee; }
        
        /* Кнопка удаления */
        .del-btn { 
            position: absolute; right: 0; top: 0; 
            background: rgba(255,255,255,0.8); border: 1px solid #ddd; 
            color: #e74c3c; border-radius: 4px; cursor: pointer; padding: 2px 6px; font-size: 12px;
        }
        .del-btn:hover { background: #ffebee; }

        /* Чат */
        .chat-box { 
            height: 350px; overflow-y: auto; 
            background: rgba(255,255,255,0.5); 
            padding: 10px; border-radius: 6px; 
            margin-bottom: 10px; display: flex; flex-direction: column; gap: 10px; 
            border: 1px solid var(--border-glass);
        }
        .msg { max-width: 80%; padding: 8px 12px; border-radius: 12px; font-size: 14px; position: relative; word-break: break-word; }
        .msg.me { background: #d9e8f5; align-self: flex-end; border-bottom-right-radius: 2px; }
        .msg.them { background: #fff; align-self: flex-start; border-bottom-left-radius: 2px; border: 1px solid #eee; }
        .msg img { max-width: 100%; border-radius: 6px; margin-top: 5px; display: block; }
        .msg-author { font-size: 11px; font-weight: 600; color: #7f8c8d; margin-bottom: 2px; cursor: pointer; }
        .msg .del-btn { top: -8px; right: -8px; padding: 0px 4px; font-size: 10px; border-radius: 50%; }

        /* Расписание */
        .schedule-table { width: 100%; border-collapse: collapse; font-size: 12px; background: #fff; }
        .schedule-table th, .schedule-table td { border: 1px solid #e2e8f0; padding: 6px 8px; text-align: left; }
        .schedule-table th { background: #f1f5f9; color: var(--primary); }
        .day-row { background: #e2e8f0; font-weight: bold; color: var(--primary); text-align: center; }

        /* Модальные окна */
        .modal-overlay {
            position: fixed; top: 0; left: 0; right: 0; bottom: 0;
            background: rgba(0,0,0,0.4); backdrop-filter: blur(3px);
            z-index: 1000; display: none; justify-content: center; align-items: center;
        }
        .modal-content {
            background: #f8fafc; width: 90%; max-width: 400px; border-radius: 12px;
            overflow: hidden; box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            border: 1px solid var(--border-glass); position: relative;
            max-height: 90vh; display: flex; flex-direction: column;
        }
        
        /* Профиль */
        .banner-area { width: 100%; height: 100px; background: #cbd5e1; position: relative; }
        .banner-img { width: 100%; height: 100%; object-fit: cover; }
        .profile-avatar-large { width: 70px; height: 70px; border-radius: 50%; border: 3px solid #fff; position: absolute; bottom: -35px; left: 15px; background: #ccc; object-fit: cover; }
        .profile-details { padding: 45px 15px 15px 15px; text-align: left; flex: 1; overflow-y: auto; }
        .profile-quote { font-style: italic; color: var(--text-muted); margin-top: 5px; font-size: 13px; background: #f1f5f9; padding: 8px; border-radius: 6px; border-left: 3px solid var(--primary); }
        
        .close-modal { position: absolute; top: 10px; right: 10px; background: rgba(0,0,0,0.5); color: white; border: none; border-radius: 50%; width: 28px; height: 28px; font-weight: bold; cursor: pointer; z-index: 10; }

        .search-result { display: flex; justify-content: space-between; align-items: center; padding: 10px; border-bottom: 1px solid #e2e8f0; }
        .locked-msg { text-align: center; color: #c0392b; font-size: 12px; padding: 10px; font-weight: bold; }
        .locked-area { opacity: 0.5; pointer-events: none; }
        
        .file-input-wrapper { display: flex; align-items: center; gap: 10px; margin-bottom: 10px; }
        .file-input-wrapper label { background: #e2e8f0; padding: 6px 10px; border-radius: 6px; cursor: pointer; font-size: 12px; color: var(--text-main); border: 1px solid #cbd5e1; }
        .file-input-wrapper input[type="file"] { display: none; }

        /* Звонки */
        #callOverlay {
            position: fixed; top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(15, 23, 42, 0.9); z-index: 2000;
            display: none; flex-direction: column; justify-content: center; align-items: center; color: white;
        }
        #callTimer { font-size: 24px; font-weight: bold; margin-bottom: 20px; font-family: monospace; }
    </style>
</head>
<body>

    <div class="top-bar" id="topBar"><span>Загрузка...</span></div>
    
    <div class="auth-panel" id="authPanel">
        <input type="text" id="authName" class="form-input" placeholder="Ваше Имя (логин)" style="max-width:250px; margin: 0 auto 10px;">
        <button class="btn" style="max-width:150px; margin:0 auto;" onclick="doAuth()">Войти</button>
    </div>

    <div class="header">School Network</div>

    <div class="nav-tabs">
        <div class="nav-tab active" onclick="switchTab('feed', this)">📰 Лента</div>
        <div class="nav-tab" onclick="switchTab('chat', this)">💬 Чат</div>
        <div class="nav-tab" onclick="switchTab('friends', this)">👥 Друзья</div>
        <div class="nav-tab" onclick="switchTab('hw', this)">📝 ДЗ</div>
        <div class="nav-tab" onclick="switchTab('gdz', this)">✅ ГДЗ</div>
        <div class="nav-tab" onclick="switchTab('schedule', this)">📅 Уроки</div>
    </div>

    <div class="container">
        <!-- 1. ЛЕНТА -->
        <div id="screen-feed" class="screen active">
            <div class="glass-panel">
                <div class="block-title">Моя страница</div>
                <div class="block-content" style="display:flex; align-items:center; gap:15px;">
                    <img src="https://via.placeholder.com/60/cbd5e1/3b6999?text=ME" id="myAvatarView" style="width:50px; height:50px; border-radius:50%; border:2px solid #fff; object-fit:cover; cursor:pointer;" onclick="openMyProfile()">
                    <div>
                        <b id="profileName" style="font-size:15px; color:var(--primary);">Гость</b><br>
                        <span style="font-size:12px; color:var(--text-muted);">Нажмите на аватар для настроек</span>
                    </div>
                </div>
            </div>

            <div class="glass-panel">
                <div class="block-title">Новый пост</div>
                <div class="block-content locked-area" id="postFormArea">
                    <textarea id="postText" class="form-input" placeholder="Что нового?" style="height:60px; resize:none;"></textarea>
                    <div class="file-input-wrapper"><label for="postImage">📷 Фото</label><input type="file" id="postImage" accept="image/*"></div>
                    <button class="btn" onclick="createPost()" id="postBtn">Опубликовать</button>
                </div>
            </div>

            <div class="glass-panel">
                <div class="block-title">Лента</div>
                <div class="block-content" id="feedContainer">Загрузка...</div>
            </div>
        </div>

        <!-- 2. ЧАТ -->
        <div id="screen-chat" class="screen">
            <div class="glass-panel">
                <div class="block-title">Общий чат</div>
                <div class="block-content">
                    <div class="chat-box" id="chatBox"></div>
                    <div class="locked-area" id="chatInputArea">
                        <input type="text" id="msgText" class="form-input" placeholder="Сообщение...">
                        <div class="file-input-wrapper"><label for="msgImage">🖼️ Фото</label><input type="file" id="msgImage" accept="image/*"></div>
                        <button class="btn" onclick="sendMessage()" id="msgBtn">Отправить</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- 3. ДРУЗЬЯ -->
        <div id="screen-friends" class="screen">
            <div class="glass-panel">
                <div class="block-title">Поиск людей</div>
                <div class="block-content">
                    <input type="text" id="searchUser" class="form-input" placeholder="Введите имя..." oninput="searchUsers(this.value)">
                    <div id="searchResults" style="margin-top:10px;"></div>
                </div>
            </div>
            <div class="glass-panel">
                <div class="block-title">Друзья / Чаты</div>
                <div class="block-content" id="friendsList"><div style="font-size:13px; color:var(--text-muted);">Список пуст. Используйте поиск.</div></div>
            </div>
        </div>

        <!-- 4. ДЗ -->
        <div id="screen-hw" class="screen">
            <div class="glass-panel">
                <div class="block-title">Добавить ДЗ</div>
                <div class="block-content locked-area" id="hwFormArea">
                    <input type="text" id="hwSubj" class="form-input" placeholder="Предмет">
                    <input type="text" id="hwTask" class="form-input" placeholder="Задание">
                    <button class="btn" onclick="addHW()">Сохранить</button>
                </div>
            </div>
            <div class="glass-panel">
                <div class="block-title">Список ДЗ</div>
                <div class="block-content" id="hwContainer">Загрузка...</div>
            </div>
        </div>

        <!-- 5. ГДЗ -->
        <div id="screen-gdz" class="screen">
            <div class="glass-panel">
                <div class="block-title">Добавить ГДЗ</div>
                <div class="block-content locked-area" id="gdzFormArea">
                    <input type="text" id="gdzSubj" class="form-input" placeholder="Предмет">
                    <input type="text" id="gdzLink" class="form-input" placeholder="Ссылка на решение">
                    <button class="btn" onclick="addGDZ()">Сохранить</button>
                </div>
            </div>
            <div class="glass-panel">
                <div class="block-title">База ГДЗ</div>
                <div class="block-content" id="gdzContainer">Загрузка...</div>
            </div>
        </div>

        <!-- 6. РАСПИСАНИЕ -->
        <div id="screen-schedule" class="screen">
            <div class="glass-panel">
                <div class="block-title">Расписание (8-д / 8-е)</div>
                <div class="block-content" style="padding:0; overflow-x:auto;">
                    <table class="schedule-table">
                        <thead><tr><th>Урок</th><th>8-д</th><th>8-е</th></tr></thead>
                        <tbody>
                            <tr><td colspan="3" class="day-row">Понедельник</td></tr>
                            <tr><td>1</td><td>в.д. Разговоры о важном</td><td>в.д. Разговоры о важном</td></tr>
                            <tr><td>2</td><td>Алгебра</td><td>Труд</td></tr>
                            <tr><td>3</td><td>Русский язык</td><td>Биология</td></tr>
                            <tr><td>4</td><td>Биология</td><td>Русский язык</td></tr>
                            <tr><td>5</td><td>Физкультура</td><td>Алгебра</td></tr>
                            <tr><td>6</td><td>Химия</td><td>География</td></tr>
                            <tr><td>7</td><td>Литература</td><td>в.д. ДКП</td></tr>
                            <tr><td colspan="3" class="day-row">Вторник</td></tr>
                            <tr><td>1</td><td>Информатика</td><td>Алгебра</td></tr>
                            <tr><td>2</td><td>Химия</td><td>Физкультура</td></tr>
                            <tr><td>3</td><td>Физкультура</td><td>Химия</td></tr>
                            <tr><td>4</td><td>Алгебра</td><td>Русский язык</td></tr>
                            <tr><td>5</td><td>История</td><td>Английский язык</td></tr>
                            <tr><td>6</td><td>Английский язык</td><td>Литература</td></tr>
                            <tr><td>7</td><td>Музыка</td><td>Геометрия</td></tr>
                            <tr><td colspan="3" class="day-row">Среда</td></tr>
                            <tr><td>1</td><td>Алгебра</td><td>История</td></tr>
                            <tr><td>2</td><td>История</td><td>Информатика</td></tr>
                            <tr><td>3</td><td>Русский язык</td><td>Русский язык</td></tr>
                            <tr><td>4</td><td>Физика</td><td>Литература</td></tr>
                            <tr><td>5</td><td>ОБЗР</td><td>Физика</td></tr>
                            <tr><td>6</td><td>Геометрия</td><td>Английский язык</td></tr>
                            <tr><td>7</td><td>Английский язык</td><td>География</td></tr>
                            <tr><td colspan="3" class="day-row">Четверг</td></tr>
                            <tr><td>1</td><td>Геометрия</td><td>Русский язык</td></tr>
                            <tr><td>2</td><td>Труд</td><td>Алгебра</td></tr>
                            <tr><td>3</td><td>Русский язык</td><td>Химия</td></tr>
                            <tr><td>4</td><td>в.д. Россия – мои горизонты</td><td>Геометрия</td></tr>
                            <tr><td>5</td><td>Информатика</td><td>ОБЗР</td></tr>
                            <tr><td>6</td><td>География</td><td>История</td></tr>
                            <tr><td>7</td><td>История</td><td>Физкультура</td></tr>
                            <tr><td>8</td><td>в.д. ДКП</td><td>в.д. Россия – мои горизонты</td></tr>
                            <tr><td colspan="3" class="day-row">Пятница</td></tr>
                            <tr><td>1</td><td>Русский язык</td><td>История</td></tr>
                            <tr><td>2</td><td>Физика</td><td>Музыка</td></tr>
                            <tr><td>3</td><td>Вероятность и статистика</td><td>Биология</td></tr>
                            <tr><td>4</td><td>Биология</td><td>Вероятность и статистика</td></tr>
                            <tr><td>5</td><td>География</td><td>Физика</td></tr>
                            <tr><td>6</td><td>Английский язык</td><td>Информатика</td></tr>
                            <tr><td>7</td><td>Литература</td><td>Английский язык</td></tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- МОДАЛКА ПРОФИЛЯ -->
    <div class="modal-overlay" id="profileModal">
        <div class="modal-content">
            <button class="close-modal" onclick="closeModal('profileModal')">×</button>
            <div class="banner-area" id="modalBanner"><img src="" id="modalBannerImg" class="banner-img" style="display:none;"></div>
            <img src="" id="modalAvatar" class="profile-avatar-large">
            <div class="profile-details">
                <h2 id="modalName" style="margin:0 0 5px 0; color:var(--primary); font-size:18px;">Имя</h2>
                <div class="profile-quote" id="modalQuote">...</div>
                <div id="editProfileTools" style="display:none; margin-top:15px; border-top:1px solid #ddd; padding-top:15px;">
                    <input type="text" id="editQuote" class="form-input" placeholder="Цитата...">
                    <div class="file-input-wrapper"><label for="editBannerFile">Баннер</label><input type="file" id="editBannerFile" accept="image/*" onchange="uploadBanner(this)"></div>
                    <div class="file-input-wrapper"><label for="editAvatarFile">Аватар</label><input type="file" id="editAvatarFile" accept="image/*" onchange="uploadAvatar(this)"></div>
                    <button class="btn" onclick="saveProfileChanges()">Сохранить</button>
                </div>
            </div>
        </div>
    </div>

    <!-- МОДАЛКА ЛИЧНОГО ЧАТА -->
    <div class="modal-overlay" id="privateChatModal">
        <div class="modal-content" style="height: 80vh; padding:0;">
            <div style="background: var(--primary); color:white; padding:10px 15px; display:flex; justify-content:space-between; align-items:center;">
                <b id="privateChatName">Чат</b>
                <div>
                    <button class="btn" style="width:auto; padding:5px 10px; background:#27ae60; display:inline-block; margin-right:5px;" onclick="startCall()">📞 Звонок</button>
                    <button class="close-modal" style="position:static; background:transparent;" onclick="closeModal('privateChatModal')">×</button>
                </div>
            </div>
            <div class="chat-box" id="privateChatBox" style="flex:1; margin:0; border-radius:0; border:none;"></div>
            <div style="padding:10px; background:#fff; border-top:1px solid #ccc;">
                <input type="text" id="privateMsgText" class="form-input" placeholder="Сообщение...">
                <div style="display:flex; gap:10px;">
                    <div class="file-input-wrapper" style="flex:1; margin:0;"><label for="privateMsgImage">📷 Фото</label><input type="file" id="privateMsgImage" accept="image/*"></div>
                    <button class="btn" style="flex:1;" onclick="sendPrivateMessage()">Отправить</button>
                </div>
            </div>
        </div>
    </div>

    <!-- ОВЕРЛЕЙ ЗВОНКА -->
    <div id="callOverlay">
        <div id="callStatus" style="font-size:18px; margin-bottom:10px;">Соединение...</div>
        <div id="callTimer">10:00</div>
        <button class="btn btn-danger" style="width:auto; padding:10px 30px; border-radius:30px;" onclick="endCall()">Завершить</button>
        <audio id="remoteAudio" autoplay></audio>
    </div>

    <script type="module">
        import { initializeApp } from "https://www.gstatic.com/firebasejs/10.8.1/firebase-app.js";
        import { getDatabase, ref, push, onValue, set, get, remove, onDisconnect } from "https://www.gstatic.com/firebasejs/10.8.1/firebase-database.js";

        const firebaseConfig = {
            apiKey: "AIzaSyC9rKXKdnooeJlN8e8_ydbakgEs8ybs60o",
            authDomain: "savcompay.firebaseapp.com",
            databaseURL: "https://savcompay-default-rtdb.europe-west1.firebasedatabase.app",
            projectId: "savcompay",
            storageBucket: "savcompay.firebasestorage.app",
            messagingSenderId: "323188285385",
            appId: "1:323188285385:web:d5c2e68347a660cf7a1218"
        };

        const IMGBB_API_KEY = "fa3d56b9fb97bfbbe162c367ace448d1";
        const app = initializeApp(firebaseConfig);
        const db = getDatabase(app);

        let currentUser = localStorage.getItem('schoolUser') || null;
        let userAvatar = localStorage.getItem('schoolAvatar_' + currentUser) || "";
        let userBanner = localStorage.getItem('schoolBanner_' + currentUser) || "";
        let userQuote = localStorage.getItem('schoolQuote_' + currentUser) || "Я здесь!";
        
        // Модератор
        const MODERATOR = "@glebb"; 
        const isMod = () => currentUser === MODERATOR;

        let currentPrivateChatUser = null;
        let tempBannerUrl = userBanner;

        // === АВТОРИЗАЦИЯ ===
        window.doAuth = function() {
            const name = document.getElementById('authName').value.trim();
            if (name === '') return alert('Введите имя!');
            get(ref(db, 'users/' + name)).then((snapshot) => {
                if (!snapshot.exists()) {
                    set(ref(db, 'users/' + name), { name: name, avatar: "", banner: "", quote: "Я здесь!" });
                }
                currentUser = name;
                localStorage.setItem('schoolUser', currentUser);
                window.location.reload();
            });
        };
        window.logout = function() { localStorage.removeItem('schoolUser'); window.location.reload(); };

        async function syncProfile() {
            if(!currentUser) return;
            const snap = await get(ref(db, 'users/' + currentUser));
            if(snap.exists()) {
                const data = snap.val();
                if(data.avatar) { userAvatar = data.avatar; localStorage.setItem('schoolAvatar_' + currentUser, userAvatar); }
                if(data.banner) { userBanner = data.banner; localStorage.setItem('schoolBanner_' + currentUser, userBanner); }
                if(data.quote) { userQuote = data.quote; localStorage.setItem('schoolQuote_' + currentUser, userQuote); }
                updateMyAvatarView();
            }
        }

        function checkAuth() {
            const topBar = document.getElementById('topBar');
            const profileName = document.getElementById('profileName');
            const lockedAreas = document.querySelectorAll('.locked-area');
            const authPanel = document.getElementById('authPanel');

            if (currentUser) {
                topBar.innerHTML = `<span>Вы вошли как: <b>${currentUser}</b> ${isMod() ? '🛡️' : ''}</span> <a href="#" onclick="logout()">Выйти</a>`;
                profileName.innerText = currentUser;
                updateMyAvatarView();
                lockedAreas.forEach(el => el.classList.remove('locked-area'));
                syncProfile();
                // Статус онлайн
                const userStatusRef = ref(db, 'status/' + currentUser);
                set(userStatusRef, 'online');
                onDisconnect(userStatusRef).set('offline');
            } else {
                topBar.innerHTML = `<span>Гость</span> <a href="#" onclick="document.getElementById('authPanel').style.display='block'">Вход</a>`;
                profileName.innerText = 'Гость';
                authPanel.style.display = 'block';
            }
        }

        function updateMyAvatarView() {
            document.getElementById('myAvatarView').src = userAvatar || 'https://via.placeholder.com/60/cbd5e1/3b6999?text=ME';
        }

        // === ЗАГРУЗКА ФОТО ===
        async function uploadToImgBB(file) {
            const formData = new FormData(); formData.append('image', file);
            try {
                const response = await fetch(`https://api.imgbb.com/1/upload?key=${IMGBB_API_KEY}`, { method: 'POST', body: formData });
                const data = await response.json();
                return data.success ? data.data.url : null;
            } catch (error) { alert('Ошибка загрузки фото'); return null; }
        }

        // === ПРОФИЛЬ ===
        window.openMyProfile = function() { if (currentUser) openProfileModal(currentUser, true); };
        window.openProfileModal = async function(username, isMe = false) {
            if(!currentUser) return alert("Войдите!");
            const snap = await get(ref(db, 'users/' + username));
            const userData = snap.exists() ? snap.val() : { name: username, avatar: '', banner: '', quote: '...' };
            
            document.getElementById('modalName').innerText = userData.name;
            document.getElementById('modalQuote').innerText = userData.quote || '...';
            document.getElementById('modalAvatar').src = userData.avatar || 'https://via.placeholder.com/80';
            
            const bannerImg = document.getElementById('modalBannerImg');
            if(userData.banner) { bannerImg.src = userData.banner; bannerImg.style.display = 'block'; } 
            else { bannerImg.style.display = 'none'; }

            const tools = document.getElementById('editProfileTools');
            if (isMe) {
                tools.style.display = 'block';
                document.getElementById('editQuote').value = userData.quote || '';
                tempBannerUrl = userData.banner || '';
            } else { tools.style.display = 'none'; }
            document.getElementById('profileModal').style.display = 'flex';
        };

        window.uploadBanner = async function(input) {
            if (input.files && input.files[0]) {
                document.getElementById('modalBannerImg').src = 'https://via.placeholder.com/400x100?text=...';
                document.getElementById('modalBannerImg').style.display = 'block';
                const url = await uploadToImgBB(input.files[0]);
                if (url) { tempBannerUrl = url; document.getElementById('modalBannerImg').src = url; }
            }
        };
        window.uploadAvatar = async function(input) {
            if (input.files && input.files[0]) {
                document.getElementById('modalAvatar').src = 'https://via.placeholder.com/80?text=...';
                const url = await uploadToImgBB(input.files[0]);
                if (url) {
                    userAvatar = url; document.getElementById('modalAvatar').src = url;
                    localStorage.setItem('schoolAvatar_' + currentUser, userAvatar);
                    updateMyAvatarView();
                    set(ref(db, 'users/' + currentUser + '/avatar'), userAvatar);
                }
            }
        };
        window.saveProfileChanges = function() {
            userQuote = document.getElementById('editQuote').value.trim();
            userBanner = tempBannerUrl;
            localStorage.setItem('schoolQuote_' + currentUser, userQuote);
            localStorage.setItem('schoolBanner_' + currentUser, userBanner);
            set(ref(db, 'users/' + currentUser), { name: currentUser, avatar: userAvatar, banner: userBanner, quote: userQuote })
            .then(() => { alert('Сохранено!'); closeModal('profileModal'); });
        };

        // === 1. ЛЕНТА ===
        const feedRef = ref(db, 'posts');
        window.createPost = async function() {
            if (!currentUser) return;
            const text = document.getElementById('postText').value.trim();
            const fileInput = document.getElementById('postImage');
            if (text === '' && fileInput.files.length === 0) return alert('Пустой пост!');
            
            const btn = document.getElementById('postBtn'); btn.disabled = true; btn.innerText = '...';
            let imgUrl = fileInput.files.length > 0 ? await uploadToImgBB(fileInput.files[0]) : '';

            push(feedRef, { author: currentUser, avatar: userAvatar, text, img: imgUrl || '', timestamp: Date.now() })
            .then(() => {
                document.getElementById('postText').value = ''; document.getElementById('postImage').value = '';
                btn.disabled = false; btn.innerText = 'Опубликовать';
            });
        };

        window.deletePost = function(key, author) {
            if (currentUser === author || isMod()) {
                if(confirm('Удалить пост?')) remove(ref(db, 'posts/' + key));
            } else alert('Нет прав!');
        };

        onValue(feedRef, (snapshot) => {
            const container = document.getElementById('feedContainer');
            container.innerHTML = '';
            const data = snapshot.val();
            if (!data) { container.innerHTML = '<div style="font-size:13px;color:var(--text-muted);text-align:center;">Пусто</div>'; return; }

            const posts = Object.entries(data).sort((a, b) => b[1].timestamp - a[1].timestamp);
            posts.forEach(([key, post]) => {
                const div = document.createElement('div'); div.className = 'post';
                
                // Кнопка удаления
                let delBtn = '';
                if (currentUser === post.author || isMod()) {
                    delBtn = `<button class="del-btn" onclick="deletePost('${key}', '${post.author}')">🗑️</button>`;
                }

                let html = delBtn + `<div class="post-header" onclick="openProfileModal('${post.author}')">`;
                html += `<img src="${post.avatar || 'https://via.placeholder.com/32'}" class="post-avatar"><span>${post.author}</span></div>`;
                if (post.text) html += `<div class="post-text">${post.text}</div>`;
                if (post.img) html += `<img src="${post.img}" class="post-img">`;
                
                div.innerHTML = html;
                container.appendChild(div);
            });
        });

        // === 2. ОБЩИЙ ЧАТ ===
        const chatRef = ref(db, 'chat');
        window.sendMessage = async function() {
            if (!currentUser) return;
            const text = document.getElementById('msgText').value.trim();
            const fileInput = document.getElementById('msgImage');
            if (text === '' && fileInput.files.length === 0) return;

            const btn = document.getElementById('msgBtn'); btn.disabled = true; btn.innerText = '...';
            let imgUrl = fileInput.files.length > 0 ? await uploadToImgBB(fileInput.files[0]) : '';

            push(chatRef, { author: currentUser, text, img: imgUrl || '', timestamp: Date.now() })
            .then(() => {
                document.getElementById('msgText').value = ''; document.getElementById('msgImage').value = '';
                btn.disabled = false; btn.innerText = 'Отправить';
            });
        };

        window.deleteMsg = function(key, author) {
            if (currentUser === author || isMod()) remove(ref(db, 'chat/' + key));
            else alert('Нет прав!');
        };

        onValue(chatRef, (snapshot) => {
            const box = document.getElementById('chatBox'); box.innerHTML = '';
            const data = snapshot.val(); if (!data) return;
            const msgs = Object.entries(data).sort((a, b) => a[1].timestamp - b[1].timestamp);

            msgs.forEach(([key, m]) => {
                const isMe = m.author === currentUser;
                const div = document.createElement('div');
                div.className = `msg ${isMe ? 'me' : 'them'}`;
                
                let delBtn = '';
                if (isMe || isMod()) delBtn = `<button class="del-btn" onclick="deleteMsg('${key}', '${m.author}')">×</button>`;

                let html = delBtn;
                if (!isMe) html += `<div class="msg-author" onclick="openProfileModal('${m.author}')">${m.author}</div>`;
                if (m.text) html += m.text;
                if (m.img) html += `<img src="${m.img}">`;
                
                div.innerHTML = html;
                box.appendChild(div);
            });
            box.scrollTop = box.scrollHeight;
        });

        // === 3. ДРУЗЬЯ И ЛИЧКА ===
        window.searchUsers = async function(queryText) {
            const resultsDiv = document.getElementById('searchResults'); resultsDiv.innerHTML = '';
            if(queryText.trim().length < 1) return;
            const snap = await get(ref(db, 'users'));
            if(!snap.exists()) return;
            const users = snap.val(); let found = false;

            for (const key in users) {
                if (key !== currentUser && key.toLowerCase().includes(queryText.toLowerCase())) {
                    found = true;
                    resultsDiv.innerHTML += `<div class="search-result"><div style="display:flex; align-items:center; gap:10px;"><img src="${users[key].avatar || 'https://via.placeholder.com/30'}" style="width:30px;height:30px;border-radius:50%;object-fit:cover;"><b>${users[key].name}</b></div><button class="btn" style="width:auto; padding:5px 10px; font-size:12px;" onclick="startPrivateChat('${users[key].name}')">Написать</button></div>`;
                }
            }
            if(!found) resultsDiv.innerHTML = '<div style="font-size:12px; color:#999;">Никого не найдено</div>';
        };

        window.startPrivateChat = function(targetUser) {
            if(targetUser === currentUser) return alert("Это вы!");
            currentPrivateChatUser = targetUser;
            document.getElementById('privateChatName').innerText = `Чат с ${targetUser}`;
            document.getElementById('privateChatModal').style.display = 'flex';
            loadPrivateMessages();
        };

        function getChatId(u1, u2) { return u1 < u2 ? `${u1}_${u2}` : `${u2}_${u1}`; }

        function loadPrivateMessages() {
            if(!currentPrivateChatUser) return;
            const chatId = getChatId(currentUser, currentPrivateChatUser);
            const pChatRef = ref(db, 'private_chats/' + chatId);
            onValue(pChatRef, (snapshot) => {
                const box = document.getElementById('privateChatBox'); box.innerHTML = '';
                const data = snapshot.val();
                if (!data) { box.innerHTML = '<div style="text-align:center; color:#999; font-size:12px; margin-top:20px;">Начните диалог!</div>'; return; }

                const msgs = Object.entries(data).sort((a, b) => a[1].timestamp - b[1].timestamp);
                msgs.forEach(([key, m]) => {
                    const isMe = m.author === currentUser;
                    const div = document.createElement('div'); div.className = `msg ${isMe ? 'me' : 'them'}`;
                    let delBtn = isMe ? `<button class="del-btn" onclick="remove(ref(db, 'private_chats/${chatId}/${key}'))">×</button>` : '';
                    let html = delBtn;
                    if (m.text) html += m.text;
                    if (m.img) html += `<img src="${m.img}">`;
                    div.innerHTML = html; box.appendChild(div);
                });
                box.scrollTop = box.scrollHeight;
            });
        }

        window.sendPrivateMessage = async function() {
            if (!currentUser || !currentPrivateChatUser) return;
            const text = document.getElementById('privateMsgText').value.trim();
            const fileInput = document.getElementById('privateMsgImage');
            if (text === '' && fileInput.files.length === 0) return;

            let imgUrl = fileInput.files.length > 0 ? await uploadToImgBB(fileInput.files[0]) : '';
            const chatId = getChatId(currentUser, currentPrivateChatUser);
            push(ref(db, 'private_chats/' + chatId), { author: currentUser, text, img: imgUrl || '', timestamp: Date.now() })
            .then(() => { document.getElementById('privateMsgText').value = ''; document.getElementById('privateMsgImage').value = ''; });
        };

        // === 4. ДЗ ===
        const hwRef = ref(db, 'homework');
        window.addHW = function() {
            const subj = document.getElementById('hwSubj').value, task = document.getElementById('hwTask').value;
            if (!subj || !task) return alert('Заполните поля');
            push(hwRef, { subj, task, author: currentUser }).then(() => { document.getElementById('hwSubj').value = ''; document.getElementById('hwTask').value = ''; });
        };

        window.deleteHW = function(key, author) {
            if (currentUser === author || isMod()) { if(confirm('Удалить ДЗ?')) remove(ref(db, 'homework/' + key)); }
            else alert('Нет прав!');
        };

        onValue(hwRef, (snapshot) => {
            const c = document.getElementById('hwContainer'); c.innerHTML = '';
            const data = snapshot.val(); if (!data) { c.innerHTML = '<div style="font-size:12px;color:#888;">Нет данных</div>'; return; }
            
            Object.entries(data).forEach(([key, item]) => {
                let delBtn = (currentUser === item.author || isMod()) ? `<button class="del-btn" style="position:static; float:right;" onclick="deleteHW('${key}', '${item.author}')">🗑️</button>` : '';
                c.innerHTML += `<div style="border-bottom:1px solid #eee; padding:8px 0; overflow:hidden;">${delBtn}<b>${item.subj}</b>: ${item.task} <br><span style="font-size:11px;color:#999;">(${item.author})</span></div>`;
            });
        });

        // === 5. ГДЗ ===
        const gdzRef = ref(db, 'gdz');
        window.addGDZ = function() {
            const subj = document.getElementById('gdzSubj').value, link = document.getElementById('gdzLink').value;
            if (!subj || !link) return alert('Заполните поля');
            push(gdzRef, { subj, link, author: currentUser }).then(() => { document.getElementById('gdzSubj').value = ''; document.getElementById('gdzLink').value = ''; });
        };

        window.deleteGDZ = function(key, author) {
            if (currentUser === author || isMod()) { if(confirm('Удалить ГДЗ?')) remove(ref(db, 'gdz/' + key)); }
            else alert('Нет прав!');
        };

        onValue(gdzRef, (snapshot) => {
            const c = document.getElementById('gdzContainer'); c.innerHTML = '';
            const data = snapshot.val(); if (!data) { c.innerHTML = '<div style="font-size:12px;color:#888;">Нет данных</div>'; return; }
            
            Object.entries(data).forEach(([key, item]) => {
                let delBtn = (currentUser === item.author || isMod()) ? `<button class="del-btn" style="position:static; float:right;" onclick="deleteGDZ('${key}', '${item.author}')">🗑️</button>` : '';
                c.innerHTML += `<div style="border-bottom:1px solid #eee; padding:8px 0; overflow:hidden;">${delBtn}<b>${item.subj}</b> <a href="${item.link}" target="_blank" style="font-size:11px; margin-left:5px;">Открыть</a></div>`;
            });
        });

        // === ЗВОНКИ (WebRTC) ===
        let pc = null; let localStream = null; let callInterval = null;
        let callTimeout = null;
        let currentCallId = null;

        const servers = { iceServers: [{ urls: ['stun:stun.l.google.com:19302', 'stun:stun1.l.google.com:19302'] }] };

        window.startCall = async function() {
            if (!currentUser || !currentPrivateChatUser) return;
            if (pc) return alert('Уже звоним!');

            currentCallId = getChatId(currentUser, currentPrivateChatUser); // Используем тот же ID
            const callRef = ref(db, 'calls/' + currentCallId);
            
            // Показываем оверлей
            document.getElementById('callOverlay').style.display = 'flex';
            document.getElementById('callStatus').innerText = 'Вызов...';
            
            try {
                localStream = await navigator.mediaDevices.getUserMedia({ audio: true, video: false });
                pc = new RTCPeerConnection(servers);
                
                localStream.getTracks().forEach(track => pc.addTrack(track, localStream));

                pc.ontrack = (event) => {
                    document.getElementById('remoteAudio').srcObject = event.streams[0];
                    document.getElementById('callStatus').innerText = 'Соединено';
                    startTimer();
                };

                // Отправляем ICE кандидатов
                pc.onicecandidate = (event) => {
                    if (event.candidate) push(ref(db, 'calls/' + currentCallId + '/candidates'), event.candidate.toJSON());
                };

                // Создаем оффер
                const offer = await pc.createOffer();
                await pc.setLocalDescription(offer);
                await set(callRef, { offer: { type: offer.type, sdp: offer.sdp }, caller: currentUser, callee: currentPrivateChatUser });

                // Слушаем ответ
                onValue(ref(db, 'calls/' + currentCallId + '/answer'), async (snapshot) => {
                    const answer = snapshot.val();
                    if (answer && pc && pc.signalingState !== 'stable') {
                        await pc.setRemoteDescription(new RTCSessionDescription(answer));
                    }
                });

                // Слушаем ICE кандидатов от собеседника
                onValue(ref(db, 'calls/' + currentCallId + '/candidates'), (snapshot) => {
                    const data = snapshot.val();
                    if (data && pc) {
                        Object.values(data).forEach(candidate => {
                            pc.addIceCandidate(new RTCIceCandidate(candidate)).catch(e => console.log(e));
                        });
                    }
                });

                // Таймаут 10 минут
                callTimeout = setTimeout(() => { alert('Лимит 10 минут!'); endCall(); }, 10 * 60 * 1000);

            } catch (err) {
                alert('Ошибка доступа к микрофону: ' + err.message);
                endCall();
            }
        };

        // Ответ на входящий звонок (упрощенно: автоответчик, если мы в чате)
        // В реальном приложении нужен UI "Входящий звонок", здесь для простоты сделаем слушатель
        onValue(ref(db, 'calls'), async (snapshot) => {
            const calls = snapshot.val();
            if(!calls || !currentUser) return;
            
            // Ищем звонок, где мы - callee
            for (const id in calls) {
                if (calls[id].callee === currentUser && !calls[id].answer && !pc) {
                    // Если мы в чате с этим пользователем и не звоним сами
                    if (currentPrivateChatUser === calls[id].caller) {
                        // Автоответ для простоты (в идеале нужна кнопка "Принять")
                        if(confirm(`Входящий звонок от ${calls[id].caller}. Принять?`)) {
                            currentCallId = id;
                            document.getElementById('callOverlay').style.display = 'flex';
                            document.getElementById('callStatus').innerText = 'Подключение...';
                            
                            try {
                                localStream = await navigator.mediaDevices.getUserMedia({ audio: true });
                                pc = new RTCPeerConnection(servers);
                                localStream.getTracks().forEach(track => pc.addTrack(track, localStream));
                                
                                pc.ontrack = (event) => {
                                    document.getElementById('remoteAudio').srcObject = event.streams[0];
                                    document.getElementById('callStatus').innerText = 'Соединено';
                                    startTimer();
                                };
                                pc.onicecandidate = (event) => {
                                    if (event.candidate) push(ref(db, 'calls/' + currentCallId + '/candidates'), event.candidate.toJSON());
                                };

                                await pc.setRemoteDescription(new RTCSessionDescription(calls[id].offer));
                                const answer = await pc.createAnswer();
                                await pc.setLocalDescription(answer);
                                await set(ref(db, 'calls/' + currentCallId + '/answer'), { type: answer.type, sdp: answer.sdp });

                                onValue(ref(db, 'calls/' + currentCallId + '/candidates'), (snap) => {
                                    const data = snap.val();
                                    if (data && pc) Object.values(data).forEach(c => pc.addIceCandidate(new RTCIceCandidate(c)).catch(e=>console.log(e)));
                                });

                                callTimeout = setTimeout(() => { alert('Лимит 10 минут!'); endCall(); }, 10 * 60 * 1000);
                            } catch(e) { alert('Ошибка: ' + e.message); endCall(); }
                        }
                    }
                }
            }
        });

        function startTimer() {
            let timeLeft = 600; // 10 минут
            const timerEl = document.getElementById('callTimer');
            clearInterval(callInterval);
            callInterval = setInterval(() => {
                timeLeft--;
                const m = Math.floor(timeLeft / 60);
                const s = timeLeft % 60;
                timerEl.innerText = `${m}:${s < 10 ? '0' : ''}${s}`;
                if (timeLeft <= 0) endCall();
            }, 1000);
        }

        window.endCall = function() {
            if (pc) { pc.close(); pc = null; }
            if (localStream) { localStream.getTracks().forEach(t => t.stop()); localStream = null; }
            clearInterval(callInterval);
            clearTimeout(callTimeout);
            document.getElementById('callOverlay').style.display = 'none';
            document.getElementById('remoteAudio').srcObject = null;
            
            if (currentCallId) {
                remove(ref(db, 'calls/' + currentCallId));
                currentCallId = null;
            }
        };

        // === УТИЛИТЫ ===
        window.closeModal = function(id) {
            document.getElementById(id).style.display = 'none';
            if(id === 'privateChatModal') { currentPrivateChatUser = null; }
        };
        window.switchTab = function(tabName, element) {
            document.querySelectorAll('.screen').forEach(s => s.style.display = 'none');
            document.getElementById('screen-' + tabName).style.display = 'block';
            document.querySelectorAll('.nav-tab').forEach(t => t.classList.remove('active'));
            element.classList.add('active');
        };

        window.addEventListener('load', () => { checkAuth(); });
    </script>
</body>
</html>
