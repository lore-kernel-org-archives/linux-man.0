Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737315;
	b=wimCeJF9p8GujVnE6l+o+94EVlVuE8BzNKfGoNEDKszs5k5PvPg0TmL6OnfahrjPG1Vx
	 9y0M9C8KdpCT/4NJCncHX1A9ggD2lnfRVMqLg10BuLpnMH0XQt2rIqO3yB0LzH/88WfMZ
	 pm+Mbzbtz2H2O9trfVhS7SqzOwIkvErtcHfOglrjulV9KoZyd/0hjZvH2oeOZM0mBQ114
	 zIB9ReI/Sb7gB3OTNuHGEr+fR/XPwHRWvF+dwWGSMrWYYyIj3b1PL+9SCGcXIcWUOv7Dg
	 9ERpnaiEtXDe1SyTNJ/S5wnc1XJP+i4gdBKWZUOcS3jbH+plnbvpOXHvjVDoFsuLfNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Uz83keaR6NAQraGB9j6jS1drxBmffxIHNAVMPMR0IZA=;
	b=lWnugHKb8XpMSkofKIzBhPehB7VwODCkKXxcRKIXhdT4PnGvNui46P66C5wd9QG7AMwB
	 b4+sH92iQ2Cd5qyk0hL7p35eUmgZxX3soMrVYAg4f6c6B8aZDhM2Jf1YKGv8ExMl2LAhM
	 e9MkmO2oZQGHCCxh9cZHbf1yyy7grBoSllOLYu59x7HcqMRuLzHJqup5GIvBhRK+j2Hrg
	 FUjknHGp513zREyGciqIkqSMqeNdWptxk9JF84D9Ml+dB+cRuAfdiRXoAjfO2J44dJDMl
	 Hd45roaq4Px91aIFBcwJB3Vq4V02KX1M8HPgwPOiu0YKGkNMC1NdgEte+uNKy3JltQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Xre8tAy;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB59606A31B
	for <linux-man@vger.kernel.org>; Tue,  3 Nov 2026 20:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FB59606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Xre8tAy
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so41957905e9.3
        for <linux-man@vger.kernel.org>; Tue, 03 Nov 2026 12:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793737314; x=1794342114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uz83keaR6NAQraGB9j6jS1drxBmffxIHNAVMPMR0IZA=;
        b=0Xre8tAyIHPYVoUVsDLXxKu3cn9NZ6RjW80dVEdt2HDjBEgg4ga3ueMVeMvKuRWfGg
         tMaY4C4Ex8caVSzTdQ3lQ79c0IwUTGtDYTzUxDUFMR+r2zkTJTiUaZmRHFRx/wHFsYSR
         OaQrmC1ATMglXtCHr4kmyUoPhZJCd03tCJp2wdrs3/P3Se+UmUOO1U7+6tyVsyXTOR4c
         sw/H5AD+rDlaZF+q8jLMoR4BFxNwiHiuAcXTR6mrVc/NJuVfzfgsIiFCixXLXwKmjb3I
         8wQI9Xvbrm1Xf3Uvl3XdduVBfmMlF03StyqDNiSc1IvA8VRUR7Yp3hGJ354IWcCfie8X
         JNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793737314; x=1794342114;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uz83keaR6NAQraGB9j6jS1drxBmffxIHNAVMPMR0IZA=;
        b=ItVBcALfozUtLKqGcPMVsHamgrLG5AkxetGq68ZSplkG2kKQgVS35tvPXt87ts2iQU
         dTr8fEacCl97EhliagyWuJhNXoyAQOWXREF6Jcvy3D0h+bglJNeYZqG36Wx4K5usoD15
         yucY6ObmjNFLtgkTgPWzbYMsB9afeY7Ifh9tfG4xqy+fhfM2zAiwaqvJkrBYxJRb/q1e
         yey81S6r/KBPqgOmzZWtyAd3Kh72Uj8acOtR1+CgEWGZFrWNlnE+Y2ChLQWBCpyh4RiH
         b8SgRj0ICYZKi4D3ocXPILVilnEOgdBO2X8CT7oIj6ciwzZFDsESJfchonkXtqcn1fkz
         wjpw==
X-Forwarded-Encrypted: i=1; AKwUvBxVRpEvrFaOnlP2VXs6kqItHpPQWuCOtunyishI+i4AiqwyeJAFDBH7GUpet1b3xPu410wK14ol+Zo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uVLaHqOz4hudOCx2w49AmWRajNstzUEPGIIsvfrJPrQoJ9a95
	RYzoqCjqH5mr0oeuc6pfrpH6iob0dlmuCsE0RFj8IlMuWuk44wa3OEI2
X-Gm-Gg: AYBFou1cakOlP4vHSSWQt3S6k2j0ZL52/jyma61DIo2GOPeXy/n0hn50/mjmYMjO5IV
	WZzbknSeYdCuzeVjK9cz19Pbf8PyrAMqMJLt+y+ZWWUlU9KeVxvW3jkych3bfXYjEOcj0V5ceH+
	J79Kl0U+AQBnPvLwNQHYCvZjUC2ZlY/wCXA+m7N8tgU2VFE3pieKjtRtKuUrU4x48hCFkSnahQT
	FsiPd7JL31SAKmAeJWMi3hod2Wg7vjlnwa6/xibqak0xMJuoq+DypvA4C2dsmYtZM6nj9mb//Yc
	eIUrUeoaeMDmLAqd679c7598IP7sJFGnX+AsOuNQ1HTWC2oqyzuqMuwbkZ0oFD6BwrSfgFw4kS5
	ErJwDZSbqJenMahnxOw9d20UVaw6UtukiLdxaKgfZKJVhqPKoiPRIzS/YWSExpUASZ8/QuIX1vr
	DOn3rNbXj0KIXnExbfsBriuJf2Ch07u8pvBreR0443B8SG4yyi87vr+r51OWz/HY2qzLZTNoeYB
	bu1snPGSq+ai4+A6fEncOM94eeQ3s3epGT1eSigOLQ1Zk9lOSTLWCh6AXhSz3MPco3yO3tom14Q
	YbbXWijTpGb4OrQHNWc/dZ794ryaEIDzJ7+PHzwU44lqHwYl+LFVAg==
X-Received: by 2002:a05:600c:a00d:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4ac185bc336mr309927875e9.18.1793737313615;
        Tue, 03 Nov 2026 12:21:53 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9bd5d2fsm75107205e9.14.2026.11.03.12.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:21:53 -0800 (PST)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org
Subject: [PATCH v2 0/6] {unix,socket,bind}.7: General Unix Domain Socket fixes
Date: Tue,  3 Nov 2026 21:21:30 +0100
Message-ID: <20261103202136.13574-1-gnoack3000@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello!

This is patch set (A) spun off from the "Documentation fixes in
unix(7)" patch set [1], which is now split into these three parts:

 (A) Miscellaneous fixes, mostly in unix.7, one in socket.7     <-- this one
 (B) Socket options and Socket-level Control Messages (SCM_*)
 (C) sock_diag.7

This patch set fixes miscellaneous inaccuracies and documents missing
error codes.  It applies cleanly on the current "master".

Thank you for your reviews of v1 and v2 of the still-joined patch set,
as well as of v1 of the split patch set.

Changes in v2 (split):

* Mention commit hashes in commit messages, not in groff comments
* In SIOCINQ docs, describe SOCK_STREAM and SOCK_SEQPACKET together
* s/Named Unix Domain Sockets/pathname Unix Domain Sockets/
* Abstract namespaces: Wording simplifications
* Error descriptions: Wording simplifications
* Dropped commits:
  * Drop the commit that documented SOCK_RAW as alias for SOCK_DGRAM
  * Drop the commit that documented the socket() "protocol" argument 0
    is acceptable to avoid EPROTONOSUPPORT
  * Drop commits that already made it into the master branch.

Changes in v1 (split):

* Some commit message rewording (especially quoted the kernel code
  more directly).
* In the Abstract UDS scoping commit below, reworded the subsequent
  paragraph sligthly to avoid confusion with the "namespace"
  terminology being used differently in adjacent paragraphs.
* I removed the commit that changed the wording about Out-of-Band
  messaging, per Kuniyuki's suggestion in [2].

v1: https://lore.kernel.org/all/20261021210800.27338-2-gnoack3000@gmail.com/

This patch set has been produced with the help of a LLM, which was
helpful for spotting a long list of inaccuracies, comparing the
documentation with the kernel implementation.  (More details in [1])

–Günther

[1] https://lore.kernel.org/all/20261018173712.27670-1-gnoack3000@gmail.com/
[2] https://lore.kernel.org/all/CAAVpQUBh+J-aBLbkpzT7qmt7B714O529HWcTuQsVLT4wLBnDJA@mail.gmail.com/


Günther Noack (6):
  man/man7/socket.7: SO_PEEK_OFF: This option is no longer specific to
    unix(7)
  man/man7/unix.7: SO_PEERCRED: Also works for SOCK_SEQPACKET
  man/man7/unix.7: SIOCINQ: Document behavior for SOCK_SEQPACKET
  man/man7/unix.7: Explain Abstract UDS scoping to the network namespace
  man/man2/bind.2: ERRORS: EACCES: Write permission on the directory is
    required
  man/man7/unix.7: ERRORS: Document EACCES, EAGAIN, EMSGSIZE, ENOSPC,
    and EPERM

 man/man2/bind.2   |  4 ++-
 man/man7/socket.7 | 11 +++++---
 man/man7/unix.7   | 67 ++++++++++++++++++++++++++++++++++++++---------
 3 files changed, 66 insertions(+), 16 deletions(-)

-- 
2.56.0

