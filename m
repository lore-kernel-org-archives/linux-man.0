Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605466;
	b=WnvFjUh5TVJTsFpjhlxyrY5f8G5RmJ/qn8LhZza3cpCQsHwDoTK2ChDVYreYbNEp0LYq
	 WflY1FPHuMJq8TsalOCt+rLqpNw7IH7MW7OM2xUH5dDsVCtr7VAKeNRKosC9sh9cRr8xU
	 +1xXEAULXcLqd+1unHUCSPNWDhSTrKb1gOpLIMg3V31EHDwuPPZ2VqTZjIsh7M+3Vw/4Y
	 y06Md7Q3RSVkKxW/kPhDuleQ4HTF/sLuDtceo3V7570qVvDtkw9/o9c7J926tdvUoVy/S
	 /gEL1NnEIiXX5vh8byPSBTUtaMHgp1SXVFxXmz8lhy2lSk1jS/zioLO68Cx06W2gsog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=frsPb1t3Wa1UoN+W1OLcN+MUypjNEa6QpG2s8csovOc=;
	b=BQxTQOYTAZafnnLNWNO4NB/QaGyw2A13IoQwh2Do0knfFXe7lhqhy55tNSufH4whApW9
	 rQ0RLVjkwk2kJz+WBGLz0EEj8AzhhebIOtsSCRjl8t9kVlFCPF9AtEaPUpDfm3iRCBGGC
	 ZUWbgSCoIxd9/mWLxdWzRP5chzugL6E3jPkwKzRPpHDEvOppZluOELNmR27BzbFqKBN/W
	 wX4sutFj81oEzH1+kFSt/DnH6c2hluZFNgPBHjAD1EDFV/Pg2B/HXWtHW381MFstkRFAQ
	 CZkFVZTkN6m4vbBsF9WsPwoH9wWTDWaGMz8TFF50rhayGUcatll42lkBJjlcEC1cCBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HJ+cDcAL;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB18E606A331
	for <linux-man@vger.kernel.org>; Mon,  2 Nov 2026 07:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB18E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HJ+cDcAL
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a208d93758so28117365e9.3
        for <linux-man@vger.kernel.org>; Sun, 01 Nov 2026 23:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793605464; x=1794210264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=frsPb1t3Wa1UoN+W1OLcN+MUypjNEa6QpG2s8csovOc=;
        b=HJ+cDcALq3xnIfz5alX6NrO8pJjmgk2lptN87Lv9/jmTYd0C8pjGqWCsPnsQnEFfIc
         5euRxL2BrUL2aSUkgYwLXwRP7ZCctu5IrmPKpKW7GynqOLnaZjgXlQIjlNqBhnP4mwL1
         +cvQ0Nv/F8WdxDo/MjyDGNymVkwMk6SquY8auEWQeUPjHYtExMe3rW5GAI2oF+uj9mp0
         bq2EjuUjcX7F3xx/ZrsCS+rEbt6D1tAk8pJmoWTlYIiPr2j67fUb7zHy45fa7Z7HpP4q
         e4646eu7GoZcH6b//6E1PYX57Ce4wYme0SB7JDWYm+WVcBBdWd+sdhipZELs0I2Y/uLC
         fMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793605464; x=1794210264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=frsPb1t3Wa1UoN+W1OLcN+MUypjNEa6QpG2s8csovOc=;
        b=GxwIiAqFrYjYH9/U85mgvw31Rh+ifAyjFgvR/fntvu7TCy9Iase7Vgrd0BfR9T5G1j
         xLqbuSQmach+zJ7DGDvJ9UTHONbhKptsoBVykd9ukgREGy0yczsAg9Bm9OS+v60MR9GN
         RvHHeQAWlatVbfm7I3nfSdt4jioxOWFz6DNK0qa9RwJ3mbCr6CxkQpQ1GBBqbuhMDqm4
         Hgn2j7Cvk8dpkWO6hpWBdRlyyicobhs7qUBnWaWSEPPpdchL3W0sXWz9UiHUAxubxwzJ
         kgY4IPehP5GW0Z4XCqoTZtoRxVXM2Q4N5jLnIjOWm4c+UnayYsJfKQHP3wg25vZyOCWx
         jRZw==
X-Forwarded-Encrypted: i=1; AKwUvBwkOSgjQZUf0iawfDFACrUuufqF+OtB8GwzSA0OStx7AMY4hByLFgtHJxpYEvNaTzbcHsmXB1DSZ7c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFkRlAeZpiPF1XidUb0xJqekOjSN8Tl84mc4feiJhkqzr7MxOI
	vO3kTWkugyRDh/U6f16PutiijjKnSMuXPQxJudgv6hpHKf+lofd75LoT
X-Gm-Gg: AYBFou3MrC12QcIwUa0qW6tTBtSpsqWwGdMRWjmyTWtyj2xaZttlKZQY1zNY7Pdrr3b
	2JjKLi2fuiKr4TplfQ/noBig9lXM0Zmo1jNRPL3jWPa+f6tPu3mWcUEJOIcq9cZp4sEdeXj+Z/F
	fsNxQcQObGIFcPj16bYHnGsyurwTYLBX5cieeFbOU5gW2hI8fvoFsl78b5orn9nBDdmP66YTJ4Y
	dOGhViNmZ44kEpY21lGo6R5nzZPk4UZXNmczTkQmUW+nZDfPwWH+pj6RFrivezjy6qZ0k0IW6Zk
	9G3VVp4wjtFkXlqK/y1JS8Pf3wK4UiqefO4/0B6F2tRs1Ntiz2O7n1CV/ZaYFn1wf318c8zN4/e
	SM5y2UhuaSu8DqLKRmpExquGZzAX1Q7EhLTtYikYbMANlvKuNmHTGufI1EZ5krikGCf+zUUk6Vz
	ai01XILFUWYic7MpKQyUwjKKZ/O1TaZMV64jcez3t73g+uR2dJ6fb0RKieRCtaWDhf0WBztFLlQ
	bVHZdJi+2kHtBVVlULhC6l1T4pbtGI5p0n2i3zBe3ZNHg60GC94RI8wTn10LWztg8O+Kg78B/J8
	5FIzsR5HDjJG/A==
X-Received: by 2002:a05:600c:1907:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4ac16fa15edmr211678515e9.0.1793605464208;
        Sun, 01 Nov 2026 23:44:24 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b81c74sm18050374f8f.36.2026.11.01.23.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:44:23 -0800 (PST)
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
Subject: [PATCH RESEND 2/3] mm/mlock: reject ranges that cannot be represented
Date: Mon,  2 Nov 2026 08:44:00 +0100
Message-ID: <20261102074412.189554-3-azpijr@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102074412.189554-1-azpijr@gmail.com>
References: <20261102074412.189554-1-azpijr@gmail.com>
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

A length within a page of ULONG_MAX wraps when mlock() and munlock()
round the range to pages.  At an aligned address the length becomes 0 and
the call is a silent success; at an unaligned one it becomes a single
page, which is then locked or unlocked.  An overflowing start + len is
only caught in apply_vma_lock_flags(), after the RLIMIT_MEMLOCK check, so
mlock() returns -ENOMEM without CAP_IPC_LOCK and -EINVAL with it.

Return -EINVAL, as man 2 mlock documents, when start + len overflows or
the end overflows when rounded up to a page.  Doing this before
can_do_mlock() also avoids making the result depend on
RLIMIT_MEMLOCK/CAP_IPC_LOCK.  Requests that get a silent success today
now fail.

Reported-by: Park Tae-sun <ts930@dgu.ac.kr>
Closes: https://lore.kernel.org/all/179066531783.50175.13377521828379196177@dgu.ac.kr/
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 mm/mlock.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/mm/mlock.c b/mm/mlock.c
index 673a8433a0a9..0e9d8c110152 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -608,6 +608,7 @@ static __must_check int do_mlock(unsigned long start, size_t len,
 {
 	unsigned long locked;
 	unsigned long lock_limit;
+	unsigned long end;
 	int error = -ENOMEM;
 
 	start = untagged_addr(start);
@@ -615,12 +616,19 @@ static __must_check int do_mlock(unsigned long start, size_t len,
 	if (!len)
 		return 0;
 
+	/* Reject a wrapping range before can_do_mlock() and the rlimit check. */
+	end = start + len;
+	if (end < start)
+		return -EINVAL;
+	end = PAGE_ALIGN(end);
+	if (!end)
+		return -EINVAL;
+	start &= PAGE_MASK;
+	len = end - start;
+
 	if (!can_do_mlock())
 		return -EPERM;
 
-	len = PAGE_ALIGN(len + (offset_in_page(start)));
-	start &= PAGE_MASK;
-
 	lock_limit = rlimit(RLIMIT_MEMLOCK);
 	lock_limit >>= PAGE_SHIFT;
 	locked = len >> PAGE_SHIFT;
@@ -676,6 +684,7 @@ SYSCALL_DEFINE3(mlock2, unsigned long, start, size_t, len, int, flags)
 
 SYSCALL_DEFINE2(munlock, unsigned long, start, size_t, len)
 {
+	unsigned long end;
 	vma_flags_t flags = EMPTY_VMA_FLAGS;
 	int ret;
 
@@ -684,8 +693,14 @@ SYSCALL_DEFINE2(munlock, unsigned long, start, size_t, len)
 	if (!len)
 		return 0;
 
-	len = PAGE_ALIGN(len + (offset_in_page(start)));
+	end = start + len;
+	if (end < start)
+		return -EINVAL;
+	end = PAGE_ALIGN(end);
+	if (!end)
+		return -EINVAL;
 	start &= PAGE_MASK;
+	len = end - start;
 
 	if (mmap_write_lock_killable(current->mm))
 		return -EINTR;
-- 
2.56.0

