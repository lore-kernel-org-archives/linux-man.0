Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605459;
	b=urhKYaMDmKEkcT8tSKl0TZA/fhdOebHBocpn5jJR8iZh6ZHRIMWKtUl42NUZK1DDaLle
	 qso5zdushleOEXsFn9TnSfthWPGZs/7RhNAv1idQ6hFVEmf9LAUuKeVPiI1gIk097XkNu
	 oTB28Ea+I5h7Ld6Luu0QuC5rcPA3uu4QQBfxQeJmfsB6BU1Yt3RKGl8W3AxgffRW4mEZj
	 JDi8vaJwtc/mIO5p1EzCAKRPMqkvL4d+D53bKYjLQ9cSKQw3tdXXztgm5zNVUGIptXtMg
	 XtwXcbjaF+ezKKh2S/KywP6RQHcGJybN/7OWftlvygNb/pzdy2CVkl3ebHb6eyYYbQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GMp9mcTTKC9DHoWvLxRWF3MR+m0EkCxt9LMLL8huxSQ=;
	b=WoxP6kNRSLIYQPcA255ub96elK4HKJPwVc9iqYgU+41gYk5+P+UXSAS9+koJ/GeKpnQw
	 zJTaVfPR3PZkkHmeq4DKO0WpqgaoitfqFba/fFnIul5hZmu2W6ECStVYTC7qCKC5R4Mdk
	 0/r8eKcrKMBCLetc1SwbyFCLv7ART+xZLyH0fHUA6+mPMTq7SjTuFc6U+/xeNOhmjhNKJ
	 UqoU+6msHwK8WXf0/SHciJt4ku26eKwK5H/YW8rDLWAzol0xDrNjMLVEkXArIxMil+b3u
	 tjfz8J3KMqVgExjnsgAUXE7ggVuhFP1bnhkn4jtta4HlXZB4IzXQfUfVtoh8mBxc33g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OYjCNJ4Y;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4F0606A326
	for <linux-man@vger.kernel.org>; Mon,  2 Nov 2026 07:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B4F0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OYjCNJ4Y
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1802176f8f.1
        for <linux-man@vger.kernel.org>; Sun, 01 Nov 2026 23:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793605458; x=1794210258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GMp9mcTTKC9DHoWvLxRWF3MR+m0EkCxt9LMLL8huxSQ=;
        b=OYjCNJ4YGN418aOh4vtw14+7AbwL7A3Ew1CDtb+YSuxsqDbyN3W3NuNSwtJa2wrcK+
         /0DbK6/gccivSLcebaEXKX+PuviBnQdEZl5rWvIUJE0+unubt6dYmDsFeZl5JUyTPfJA
         eb5cfsbZTdDxFpV9Z2S2YwoHdgZgDyswjQ9g1w13yyKdN9fbW7JBUGkDsTW8DY8T4vrO
         vxyyS3wp/hibMOyq4jZ+uN+QFFFQYYKjWb/9TtDlU0VZ5kIriHuMnnVNtNup9Q+7OoJQ
         uGL5ABBYMspVQzy6ukvZB69Smvf1uU8UokxPfb3jSB6aTAWGnHCzZPdyzW+aWE7smNI9
         qv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793605458; x=1794210258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMp9mcTTKC9DHoWvLxRWF3MR+m0EkCxt9LMLL8huxSQ=;
        b=qcdmqIINw2aVxg2mMy1geZgV2K9/w/C4cRx/K80I3VxUHowSMr2QGhuhwmXLlFgcMp
         oxZWIkqB7AMgPedP5aqiaPxtNty7fMi12ISzD51YgOWcdw1NXFbqc1JZ7LR56CAbkmb0
         0c9kK1xUz0cJ5+2/myXmAqqu7R5QcC/tL6LUE9M+rsgCcq4lPM/z1cwpSnF105LOJziP
         QgFC4kLRXl8npa0UdZSX1eyIxgzuMUZms5nYHQEESVoMivkIP76qy3HOonNL/m3OYDIL
         stRV92OEjWleTKoJAIXTK/JAwuMnRdl0mAfRysDuGZKxmf6PNV+hCUJ1rM2XCcjlzIuX
         7T5w==
X-Forwarded-Encrypted: i=1; AKwUvBxyPp8NCerY4UL/lMtV8FnK/iSDarzN6UhFT0wht6ZSSWZLVbJCrOJlnJMOr20rJNYOj3MSPlIIkXQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z86KaeWNOXfid+e6uWq3+3argZhRmL/EfCu6KBDR3Cw6zpZykrl
	nSprKoePDF1r92TqPirACWyhhg3zvag0qYcQiSOQEW1JmToKQuGVa+O5
X-Gm-Gg: AYBFou2Sc8JWkTdGxl+7kkrj1IiyllZE16694oPoTzXwRkv1CrbBsdsoN1i2sOM2U1/
	AlzjsCTAg8Y1bKepfkntyCtKz399COBYWsyV5XQ7e/dQjCqCCxI3xIaztkiR+MJQi34lUR7AecX
	axt4UNIv2wpN1g9IAVRpQBdid8dgV71DMm6QSaX/TXMBUksaYZuvzU+aNpHDw7aoIing1e/sKMh
	nV78PtlWSHYgbCxQRQwGYA5bxnLrQktAkqwJETITjaAVfIk+zuT7h2QBSersim9+979apDz9B1k
	im01Rbr/3k3dJ721mAeTg+0YlxQnEh0XCzWjfPOZENSNNZ1La+COlJ4dx7i6WW5pR6D4r3iWnhs
	UoMjVKVC3SjPAdjc/kOaoB6eRJldDo6WwmrOD3Dez8GPXZrf6zmKODLQI0l7QvBZ74EO8BbtJ9G
	XQmFfC7z8VoMs64746cZwANT6xL2fr0ujDzToo/vLUfpseeh27KyhLR+JssVsxthrHijWj9QJBg
	OTyFxNzfT7lTcJApQKcYcB962SfuIp+K6FFvITbPu2hV2Wd8UFleIZgzRFFnwIWqEv1Y6r2KuQE
	Lr5MHzbaeEfxFw==
X-Received: by 2002:a05:6000:2387:b0:48e:20f9:8d75 with SMTP id ffacd0b85a97d-48e6e50b79cmr21195080f8f.48.1793605457581;
        Sun, 01 Nov 2026 23:44:17 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b81c74sm18050374f8f.36.2026.11.01.23.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:44:16 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	ts930@dgu.ac.kr,
	alx@kernel.org,
	linux-api@vger.kernel.org,
	linux-man@vger.kernel.org,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [PATCH RESEND 0/3] mm/mlock: make zero length requests a no-op and reject wrapping ranges
Date: Mon,  2 Nov 2026 08:43:58 +0100
Message-ID: <20261102074412.189554-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No changes, rebased on mm-new, Cc fixed.

Follow-up to Park Tae-sun's patch [1], which was dropped. David asked
which of the cases it raised can actually be triggered, and for selftests
that show them. Two can.

Patch 1 makes a zero length mlock()/munlock() a no-op before the address
is rounded. Today mlock(addr + 5, 0) locks a page and munlock(addr + 5, 0)
unlocks one.

Patch 2 rejects ranges where start + len overflows, or where the end
overflows when rounded to a page. Today these get a silent success, act
on a single page, or get -ENOMEM/-EINVAL depending on CAP_IPC_LOCK.

Patch 3 adds both cases to mlock2-tests.

I could not find the commit that introduced either behaviour in the git
history. Both are already present in the earliest history I could find,
so they may predate the imported git history. There is therefore no
commit to use for a Fixes tag. I have not added Cc: stable since these
changes intentionally alter UAPI-visible behaviour.

The mlock-random-test failure CI reported on [1] came from that patch,
not the test: it assigned 0 to do_mlock()'s error, which has to stay
-ENOMEM for the over-limit case, so mlock() over RLIMIT_MEMLOCK without
CAP_IPC_LOCK returned 0 without locking anything. With [1] applied the
test fails 40 runs out of 40; with error set back to -ENOMEM after the
check_mlock_range() call it passes all 40, as it does with this series.

Tested on x86_64 (KASAN, lockdep) in QEMU: mlock2-tests 31/31 as root and
as nobody, 24/31 and 23/31 on mm-unstable; mlock-random-test and
on-fault-limit pass.

[1] https://lore.kernel.org/all/179066531783.50175.13377521828379196177@dgu.ac.kr/

Jose A. Perez de Azpillaga (3):
  mm/mlock: make a zero length request a no-op whatever the alignment
  mm/mlock: reject ranges that cannot be represented
  selftests/mm: test mlock() and munlock() range normalisation

 mm/mlock.c                                |  29 +++-
 tools/testing/selftests/mm/mlock2-tests.c | 191 +++++++++++++++++++++-
 2 files changed, 215 insertions(+), 5 deletions(-)


base-commit: afb4eea28037fa55c4560313ecbd8a1e1da8369a
-- 
2.56.0

