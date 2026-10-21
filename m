Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617798;
	b=HoNJy2zgQKB98RF1knYFMyV8AqPgydzvCP/32nMbe59TJucb7ybSB5YBQB18JKu5RmsE
	 LCQvpiLcwjdRCQXiTYGf3dZU1QQoToxp/uUQAjKLmqcaAqvGqkYnrcnOWZy8TJCFCU5oI
	 PBiwjwlRKDK630XaUcPgOpKvIdyvTzo3bIlPjsrit2+yKuUaFyiHyB7LIq8a0Oz+HJRHk
	 9qf5zgXJzHnMmQTc1SE+HF/a7lCSFJH+Fc64iz2gnAEnzcYC2HbqYTmNReuAALkmpDrxf
	 pdRNDUEs2MRtCXezZao3ztcya6NPgwKJ7YQyDR64JF4rJplKO+idGAhdTkklGEjNEfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617798;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=9PTdithHjE5VspcrugLGdEWJDB3HiTmzAa+7BmCtAXg=;
	b=Ee1sfyKmMOZeYM404xEuSTw3/BPfJ4tBImU90xfcSuvH5lmlaIfoYowbbLzHwUfm96Me
	 u0ehbLHupdn96sqwy75oTIE2g6GJby+lpBjYABQ9TDwY/1+ON5CQh0CapFanEh3DtN8Gw
	 xECfk23CiNG5+dx7svYjgmyqrxbxsvSmDYPdlluzGuhFjh5QRql7gQFXjdIU8zi87P38C
	 nfNL4mvFwUQj6vmZnIDJZ88DbZWLhJtu6tJKASdjYQBI7Jsq4N4bVh69ChT9Vl9S42lj3
	 XwS0fxpyEfuMvIoMun0W1UvX5/J1mjP4HAoMCFAQDLotDnxnaspddjVQ75xkuzJd/Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NUzzs3xm;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA31606A319
	for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 21:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADA31606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NUzzs3xm
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so5797195e9.1
        for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 14:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792617796; x=1793222596; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9PTdithHjE5VspcrugLGdEWJDB3HiTmzAa+7BmCtAXg=;
        b=NUzzs3xmbxHk95KKW75vJv+3puyLgOzqA9TmawVWQ07x74NsR9ih9mjsQy+/tkeiem
         7NMjS9LP+rzB7C4ao+u9lY7rAfM/7XRhEWV5blpCGBhIqpL4GBzC2gz4leivD2Un7JAd
         n0u51fF9C5ChU9VfV2ZERiGbQmsXJDajZZoK7uQAiDgPTv5lDh455k0BsZjyoALkwJ8w
         Me3Z6mWSel6pEOtgKe8l3D9fSS6NJm+BX9sFohK2Nansuw7c83B4zvxDyoKobDrVY6hu
         17KHgWviQh64hP+kfmvpEn6VBi2q2ZlTKF9tUeqt1v3GtM9SjaNpXZgl4WDAV0/kjt5f
         MmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617796; x=1793222596;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9PTdithHjE5VspcrugLGdEWJDB3HiTmzAa+7BmCtAXg=;
        b=LF60TH4GtmbYUmBG9U9gq44zsiexa5ZdooifPvXmdotkA4WKjX4gELK/hMrmxrOV0p
         l90AYK4oua9yujdvzzO2P+fcY0ERr9EWAZAD77bHstMLz81gRkpFfEQO/l4RVi/wrTTp
         slv5L9/H1xZsEDHhyzvelorQuDzEnAu/I1QpdPI8zeunoXnKAyow0dCV1WVlPL2LWOpD
         439u+VklQ3xEJvYjdFOCogeDW6g7SFXUFo+OktLvkhAeRJe7i5h+dIg6GqkrZO69kZFH
         btDMMzPALiodP5DhobAyNACidmCoI4WrrW5fy2FnzBvR1mDqoD0bJG+wR/L8eFFEzRn/
         HiDQ==
X-Gm-Message-State: AFq9FYILfFd3Yjc2wnzDZlB7KMf+mhv7uJUkwtdUV8b0YUF5SrvlZnxS
	cDrd9bqXP4wKXjddjUFu2W86d3XaEsDprPb6znUQe5TvzPKF+Aos/i+/
X-Gm-Gg: AYBFou2yFUH9wojZlX6EQ3s6bCxgWu3AfKraQf6WLbNVU0i+G/EAiPYC+yLKD0jeYT6
	aTXhBLV/36/5gTKSojial7vWBfu0wyh9duRCEz4EqdUBc24EwGwnx3R7R9egiQADk5hnA+PKdhU
	7Xr6Aof84iDLcbInOQKGy5ub0aATU4hBd3HcBfMnNk1PJbCEOpgVnEGPg3aZWstoZ2+EDzQd1DY
	FBck0ZTZ8928aaZX0L4oEvmjmUCTnVRSQLPN4SxA4ffPOtVuMrYD7RvY9IDFbAtZmwsK5Idwclg
	E2Cdn958JJHpL4is+qL0Iy2m5wm2iMsP6cCA7Yn+RF3zSUgvB1lasNEc2xRvTvOiEWhebzNi035
	kAFVDxUgu6Tifuh36HmVAqpQ9dk+sNHVNDGvtjoRxyS0tjI1UzwddwM+KZPM4/aBVLYb/nFzrcA
	k5RqAptbu3m1l2GyJZLnVt/vtgGGklIIUdUsv6HYXuEY5G+xmyXiJlJAATCyY7dyQIsxRSqnGeP
	Q13flILbP7fa+zYQXgGjemN5ryLfQBwOSVB0EqKAQWTbORvX2QNrsScq7N/K0CB0NC/Hpz8THd4
	AiFx
X-Received: by 2002:a05:600c:3f0c:b0:49f:c199:e1e2 with SMTP id 5b1f17b1804b1-4a1fdd39fbamr71232695e9.28.1792617795995;
        Wed, 21 Oct 2026 14:23:15 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835404sm8791143f8f.42.2026.10.21.14.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:23:15 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Michael Kerrisk <mtk.manpages@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH 4/7] man/man7/unix.7: SCM_SECURITY: Generalize to other LSMs, not just SELinux
Date: Wed, 21 Oct 2026 23:22:53 +0200
Message-ID: <20261021212256.27961-5-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021212256.27961-1-gnoack3000@gmail.com>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Reword the description of SCM_SECURITY to not be specific to SELinux.

The security context is populated in scm_passec() in linux.git
net/core/scm.c, through the security_secid_to_secctx() LSM hook, which
is currently implemented by SELinux, Smack and AppArmor.

Also clarify the properties of the returned string:

* There is no NAME_MAX limit on the length; SELinux contexts can be
  longer than that.  If the control buffer is too small, put_cmsg()
  truncates the data and sets MSG_CTRUNC.

* Whether the string is null-terminated also depends on the LSM:
  SELinux includes the null byte in the length, but smack_to_secctx()
  in security/smack/smack_lsm.c uses strlen() and doesn't.

Fixes: ffad6a017f91 (2018-07-28; "unix.7: Document SCM_SECURITY ancillary data")
Cc: Michael Kerrisk <mtk.manpages@gmail.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    This feature is also available in other LSMs.  Unfortunately, they
    implemented it inconsistently and that complicates the description of
    how string boundaries are handled.  Linux does indeed neither
    guarantee that this terminates with a NUL byte, nor that NAME_MAX is
    large enough to hold it.
    
    This is the verbose variant, but I am open for suggestions regarding
    what level of detail is appropriate here.

 man/man7/unix.7 | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index ded82768322b..4abd216d19c7 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -317,7 +317,7 @@ and returned as the result of
 is an integer boolean flag.
 .TP
 .B SO_PASSSEC
-Enables receiving of the SELinux security label of the peer socket
+Enables receiving of the security label of the peer socket
 in an ancillary message of type
 .B SCM_SECURITY
 (see below).
@@ -544,13 +544,26 @@ message, the
 option must be enabled on the socket.
 .TP
 .B SCM_SECURITY
-Receive the SELinux security context (the security label)
-of the peer socket.
-The received ancillary data is a null-terminated string containing
+Receive the security context (the security label)
+of the peer socket,
+as provided by the active Linux Security Module (LSM),
+such as SELinux or Smack.
+The received ancillary data is a string containing
 the security context.
-The receiver should allocate at least
+Whether the string includes a terminating null byte
+depends on the LSM;
+the length of the data is given by the
+.I cmsg_len
+field.
+There is no fixed limit on the length of the security context;
+allocating
 .B NAME_MAX
-bytes in the data portion of the ancillary message for this data.
+bytes in the data portion of the ancillary message
+is usually enough.
+If the buffer is too small,
+the data is truncated and the
+.B MSG_CTRUNC
+flag is set (see below).
 .IP
 To receive the security context, the
 .B SO_PASSSEC
-- 
2.56.0

