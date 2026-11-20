Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181156;
	b=S4V0g1xJmIialFHkJBGFeGrXffUR1oaGLaL11Cle2mWM/pXiWosGK1g82di3vYo4TqQX
	 XFYOaYjknoXE5/KfD1JdymbXQjt1ngpzt3uSI4edNEdCC+AKQn+YNAVAQEJP84nxh4uoD
	 s78zNeYAOSe947xpoAJBx2xXTU5iwn4jL6c2IFTM60JED2o04M35ukKQUth0WTY7OjtUt
	 me8m19Kx3paoTGc+neqKfakb5JHRfO4kpBAIeuzoy+UBrFeY7DPKI9AeL2XVplt4ojv6y
	 Tr8ZRB+L/S+9otrryefbN1eWwR8v1tzDn3bwIx/eb0zHI+BMjpn+b4Uh+Key3c9S/KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=RxHhqLzpVpjVxni80NXQkwV5VBwiAeR8MFn+q2LBOxQ=;
	b=n2X/Y9xQUcgreXAYRRuSjqOs6UYjtnPxPsFjOsHDJx37UgivfSGSe4Nxh3CCHMgEsf8A
	 e9E6zUhBasd/G6iEOOitKf7/r1tQEdyRcOW55D1fnEFn6xdZ+ZViMJ3FWPE8qFOiYYHD7
	 fb0fTb4xzGVeB0MAsyUfHb325595r23aY4xxRSSh9htVIDLcUeE+k1zPQHQuQo77ACCEs
	 obvN8WdJG8M9ZpMX/WNRgUwObv8ouWiSlIpK8kOOyAuOL+zVbOpwTcHaJ0ZNrAmabX/Hn
	 DdbCxHGUyGkTco4sDeXro0C31jTPNlyRGpg9Tym4GzGDpT8kL52+Le7aogtANc9MWKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z0x6TD1J;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5A0606A320
	for <linux-man@vger.kernel.org>; Fri, 20 Nov 2026 13:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C5A0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z0x6TD1J
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so6724745e9.2
        for <linux-man@vger.kernel.org>; Fri, 20 Nov 2026 05:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795181154; x=1795785954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RxHhqLzpVpjVxni80NXQkwV5VBwiAeR8MFn+q2LBOxQ=;
        b=z0x6TD1JXZP+Nfcu7BpIT5laUZI726ki4nUyBtZJr4fYae3gVsqgHSrhi8iXWWJYvY
         zt6PKVT9G4PioA5/b5NXbGUeilV7JIk4zrpXYvSfRnxXyhAfVR8SyylE0Alh8Bhboo7X
         kO1LpXa7/dHX7n6sTsL8lPtRcIqTD1toeAxH2dtbRzOp3fGHVdBTZOi6JAG1OpdUyh8U
         Z08UTEFXjiCvweJnYfjkSHPV4uDilf1lZTN1HlS/JC0iB8LtI6Yn/fQ1Y8AySHsf3O7s
         f3+zMbg/UrUiT+AfBVY+NChdSXcMOUAXqcTPfrACZziKgJXflWn+23kJ4bcTBtXP1vcx
         kYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795181154; x=1795785954;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RxHhqLzpVpjVxni80NXQkwV5VBwiAeR8MFn+q2LBOxQ=;
        b=lXQC0TrwASw2DIUHHOeJ6IEQu3rNeWRDjDiBKeKRw8GAz1cdyUZq7y/Zwlo5eaqgsI
         m0k2jcjpqi1Txh3qGspT3dyFW3wYXvKXzognZIsg9mZdpe/wk3yEdLN7ASzJBwwcaucY
         gkvkJjmQ+F5m4ltF+H0zQtrdgw+9YpjU86SBVg/BCL0bVFbnqAT/aMwRoyTfDm8igD+7
         8RX2fpQwDYs9+k+TIIdRjbTvzma7BWteZU2PlruabeVMsfC9d3bZq+TCCeB/RX7+KHU+
         WEdp7wx12J3heAvMsD3raYnAENk1mtmm4sMiXCdM/+2XqRnoPvu6OaeqkY3Iu+fp53NJ
         Jaxw==
X-Forwarded-Encrypted: i=1; AL+hErG1d6TaZPRErUGCEImwGKMreRKOnn3O6LxLzxJSt4Zpg2R2dZG+Ec0UvseHMkfxh4gj3b2iLStJdew=@vger.kernel.org
X-Gm-Message-State: APuU4Z9g+GGxIGtmDZe+tbVZaF9LueDC2a6lucQwUdoEzzwQIRTEUc70
	FlPCGFMN3TTDMyfdW/gAxk6Kuk7XILqtqwJc+2GS6eStPwFY1vjDb60nGdAGES3U
X-Gm-Gg: AYBFou1bdHltCHpBGk/uEc0nUHPhl9OsU2b9laAfsUtW61QS8NezZH614FML8EhYvjo
	OMEMOcuRJ9qighx1bpggq8qDwN+mLB8bO1MHCs3S1Cdk23U/DmQ317fHKn4vspNxgiQWLTqgEQE
	126VUrOA/uh+Pl+K35JVJvRNHMl0bBrkLrBiU3uxTURwI4at6RyJjtKdmA0T35ByexuD8GHjbHb
	JC8/hkPXfsthdP61XurMxnWTb2bNWJHZh+6ysQXl3K7iIKtJCQJywhU7po+//ivc6hOUPhIJVDD
	PCw+efzcfNGEtj+cw6b3gFBID77z1iEIbBxctwVdzTHO24ncFTrFtk5IAohfqDL6iO4gPXit+ci
	TQqmpQFzwFNFA9a8UaXlEEX/d08Iozso/HtD3svpaPUkitxie5y7HMlf9/0Flw368zknCJG6uKi
	P8WFrWFu3nYmIDc3Ra5AIdHU9JLzuFBg+xvGmHfO4atEgV68pXPzPclWZTExzkruwOBF61teEj1
	VQhaVnT2LbQqA1/cB+6sy1eem1CmnbM4yLtN8bpAVR2cH+v6apaZhCYlDjPIn7ya3fPtAaXQXZ4
	qNwMW6sKY7N/gBMw2/NEh2rrn+zZrQH/mxnl8KCloc8Eyx8EuMi/gg==
X-Received: by 2002:a05:600c:820d:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4bb887c2ca3mr74207715e9.4.1795181153403;
        Fri, 20 Nov 2026 05:25:53 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm119581715e9.13.2026.11.20.05.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:25:53 -0800 (PST)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org
Subject: [PATCH v3 0/1] {unix,socket,bind}.7: General Unix Domain Socket fixes
Date: Fri, 20 Nov 2026 14:25:34 +0100
Message-ID: <20261120132535.20557-1-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Changes in v3 (split):

* Mention EADDRINUSE in commit message for error code patch.
* Dropped already-merged commits (all but the one about error codes)

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
v2: https://lore.kernel.org/all/20261103202136.13574-1-gnoack3000@gmail.com/

This patch set has been produced with the help of a LLM, which was
helpful for spotting a long list of inaccuracies, comparing the
documentation with the kernel implementation.  (More details in [1])

–Günther

[1] https://lore.kernel.org/all/20261018173712.27670-1-gnoack3000@gmail.com/
[2] https://lore.kernel.org/all/CAAVpQUBh+J-aBLbkpzT7qmt7B714O529HWcTuQsVLT4wLBnDJA@mail.gmail.com/


Günther Noack (1):
  man/man7/unix.7: ERRORS: Document EACCES, EAGAIN, EMSGSIZE, ENOSPC,
    and EPERM

 man/man7/unix.7 | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

-- 
2.56.1

