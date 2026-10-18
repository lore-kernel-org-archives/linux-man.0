Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D144407563
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 17:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345065; cv=none; b=pN07XroWesuV8SmLkEzUsL6XYQzLZ5bWrdjqXzYulOaMoc3/rYvt0b0WCohGBnnHCn1fKU0OMU81xiphuYxLkz/w1mScvS3lv/aqFfiXAcHrXttD7Xqr3o86aoPrSVIYcWqLkNBMd2zXhtaNCzYr5104ioLzxnCSAFXHHIT0Azk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345065; c=relaxed/simple;
	bh=P42/i7UpawIAHg2G7xULWc68ncBj625oT0vewfKRuAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HeIYaYaBaybK5BvRu9Q5mzGT02IsgFRtuHi/f3C6+CvWOiTD5YJHBsggFJLovA8JKSL1FS3ywWmpd/mFLENomJSPmoGVHae81hKON0clePzpVFM+kD4RRPsG4sLV4GPpoMB3Jz71608anso6u3eP1oifJh0VDQCPooCNTtWmn5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHuhUV6O; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHuhUV6O"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e00eee27dso651891f8f.0
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 10:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792345062; x=1792949862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mQgsJejnSg5GNvqO8GP37EkkN4GNF2ODEZZ4GohDAiA=;
        b=aHuhUV6OwI7aoRBTVnulVZqMt5bU1p9f71ciYv0jsQ6USd2eVZv152N2zd7+rQpLBi
         /liIRruKU95HntHWkmqgUhUCjSfVILY6Ctsxw3TipsKmfMeOBJmlq6FGZKN/TldsDD0u
         J2Eoya3IVBx1MNoGnc6wKmHMD2OxUDGCCAaIKrhGb71SM5qvHFQbKkpHA0U47ARSfd65
         BHL7IIr6UdjcQpsyGjzljBh83tNRRDNpULQJaiFctV4lTiJl9dcmeH28QFoN92m40Pnh
         D8p7MRL8YA+9ADDTTqCIiJIberkr8rKPmRZIuhxd6LsNagXlDToFXBuR297L1vz1zZC/
         5wNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345062; x=1792949862;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQgsJejnSg5GNvqO8GP37EkkN4GNF2ODEZZ4GohDAiA=;
        b=lft6A8QoBYosg8MLK39uQrurGOeKVG3YtSyY1NgLRQ5156Km+/WJcCNIUf+HjVzxxx
         5IdGNM1aStGC0MbcscilyXeQf5nr/ziAmX+P8kZc2ULpQWjIs7LP5KUKkIIWlbEFm6na
         yx2DXEA+rCaZl9s8ikFdpwP8yhMVqngODakjPP9cy3WsE7BrfDwvCg+MXF7sPfEPf1qd
         PLf+Gtrdr6q8XFaMBlYdiTqbWDRvGlkgGvqTkvyGwjW7trGRgRuzuW0xlrYQItYzcv9n
         3geJDw/zehZ+ugjS0JSSylVUWc1n9WScK4BJC13D9UkTEi4EXvLeXYJCSTrCD5QsieLL
         YiTA==
X-Gm-Message-State: AFq9FYLYo7ZOpWv6doB6YRMwS++RN6vLTh/oin/jc0rXOVxyRRcQzbqL
	peDr/cbNiRSTmrjI6s4BgOhL1nEKV3+XAtPRxv3ZIBB/UQeFNwmeqwHV
X-Gm-Gg: AYBFou3iunraHs7aZSLVyo9lA7LH8QnwN3OJmlbhkg7KSwyYr04qUhO3lPOO8zeZEvM
	8n5+0ZWfHye4B2gHBZO1V3wmna5cEmlnr0W3hDAmh2gti1OKwaPgh/fqDpqFNvUj+MFJrqYbYNy
	M8+hXEb19xbBfreSSj7yDnOY6isnOxrgUQRQG5+4Gxs2xjYSjNmz4qyAV7uJZffCsMSd4etTAj8
	K9jRVkfOJkd2zuvcWrOtRngv0jxP1gjzLg5XyiHPfPE/h2X6mPxeVoltrPw5ugMvylGpcbsA3NC
	X8/B2DW97ipNVkLCzJ7i5CuRRCZx4ydLiJYg9uZA+9pxLZin9AEswS3kV34JTDYhLY1cLO2kdH7
	4Z+IENRL9Gi3txIlcI6XoxO2I0ClH9pr6bKdfl60YxujDxp2O+dfnAaruAGv7jAeogDf9pH4y36
	4rVlLGLJZ9Wke+W7rN2kM9Y4eC9ebI8aOr9mfNbm5sznsirC8d0mZeJU17WJ9NwGs5OBr33+dc2
	bUycpFQV99YCIP9Y4K45c4=
X-Received: by 2002:a05:6000:5c7:b0:48e:2ac:de30 with SMTP id ffacd0b85a97d-48e07fa6035mr10940642f8f.33.1792345062119;
        Sun, 18 Oct 2026 10:37:42 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4edea3sm18788988f8f.28.2026.10.18.10.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:37:41 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH v2 15/24] man/man2/bind.2: ERRORS: EACCES: Write permission on the directory is required
Date: Sun, 18 Oct 2026 19:37:03 +0200
Message-ID: <20261018173712.27670-16-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018173712.27670-1-gnoack3000@gmail.com>
References: <20261018173712.27670-1-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In addition to the search permission, binding a named UNIX domain
socket requires write permission on the parent directory.  Bring the
wording in line with similar documentation for EACCES on other
syscalls such as mkdir(2), mknod(2), connect(2), link(2) and
rename(2).

Fixes: 9d1fd1157306 (1999-06-15, 2022-12-19; "man-pages 1.24")
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    Reworded commit message and made sure that wording is in-line with
    other man pages.

 man/man2/bind.2 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man/man2/bind.2 b/man/man2/bind.2
index ccb77e553cb2..6838a9d164aa 100644
--- a/man/man2/bind.2
+++ b/man/man2/bind.2
@@ -150,7 +150,9 @@ The following errors are specific to UNIX domain
 sockets:
 .TP
 .B EACCES
-Search permission is denied on a component of the path prefix.
+Write permission is denied on the directory
+in which the socket would be created,
+or search permission is denied on a component of the path prefix.
 (See also
 .BR path_resolution (7).)
 .TP
-- 
2.56.0

