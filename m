Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616897;
	b=d/kBDxluhI+0TuehEcwz36LMxpjnFWBB4n30GJ8wW8UFjCAIB6pF6Sa2Su4L9W8PpSHx
	 m5T1nlCUvV1wb0oKVmOzK5H8NPcSjOqZhtfihtudLs8SgyN6TI3rHM4moNk7XYkYyNJmy
	 HsbdpR7mf7F+ZwMlLGKrp/SIyPq2N7C1UBfG+4GToNUTtPqntVE3FN5D4V9ObP+xOEAzq
	 KwGmmdH9dYLSPzx5lTWNw+SidZ4akUyaPNQLBC2/7tDWVl6/Op0t66qTQ3OllusdP2Xor
	 /PsWf/a5k2fG80C80D5sv4aDYfo8m8MPNu8E8eCr8g9WMZ6RgboabcVfRahs4FCG6Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=X+ZYJfFJ7dZANIKmkpEZAyLsrqjpxIoeSPVzVb7vJiY=;
	b=MeMB6RekbK9yqr2NfzeL2KnM6cgJKcFj+bWlENOWI7oNazGk2ai+N+FThsqYI9vXhMLb
	 6q5pqmZ1crD4h6nRBAkk5sERtf/tFXCt9sFjGrsqZQSnALoacBHX9W0BBoI9sChXGtmJR
	 SVuZvpCqQZpbPjcyj1B5Mq8b+0z9wnb+w8pxl0/FLbXk+BQWcUYtuqLvTR00uviVF5LFK
	 Kp79HNo9MCixgiUFIBv7fO/qMxu/WMl3uZAUuSsDAG7d186XyaYVdVBc2UigS/B2OabE2
	 aBf2cxDnLwlol1gGUYY7XIKKR5DFrbHlyZUoybpT5ohrByhti+XBfH6zR60qb96NSig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="QY/HTtOz";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543A3606A319
	for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 21:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 543A3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QY/HTtOz
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b042c0759so870079f8f.2
        for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 14:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792616896; x=1793221696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+ZYJfFJ7dZANIKmkpEZAyLsrqjpxIoeSPVzVb7vJiY=;
        b=QY/HTtOzBOcI6/2c4yF/FJwjFtE0T/Q+YMG3qSJURaFU5+0uqpwle33IMtNqmuQb3w
         5wGloMymadt/pbCoPxh0nAOWsxKs31D+aAYHBubbiPdnL+KDBuy94QN/ESrgNi0LCRFB
         rkjP6NTpkA7Mg2Kk0zboAuY8UhuY76AyObEwMRmSI3jIiAYiVKrUOnVpUeC1L6BigNeK
         A0RoPh2sqDe1jWfl1aoGEmmZAiMU38Wxf+NVWYNaEAJXGmlm4PF3MwulAKW4v6xdgrM0
         8AXgyCqsxY/Cal2poi+K1O46+U9xCFN+tSfxELpg63S5y75AtI34IZpsUgmfrnD2x9Zf
         +mpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616896; x=1793221696;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X+ZYJfFJ7dZANIKmkpEZAyLsrqjpxIoeSPVzVb7vJiY=;
        b=0JG0L3uIwQWtJSrq0Kbc+j43gSP81rMSffxyd5MlsSWa4eD+Ub3YfgpNOgGiZWIR29
         Ryic/sEkeuX0jarUcxAZsdTdi31NB38ftu1PMbWX7TYdG0xskoEMGpOWKbGK9JkyFcuH
         YtyWeYSrC2a5RyArUR44nIR780LOBQ7aOd9ZSGOcfiLdHDfh5AuJ6OH7G+E8UFhDXdnK
         oLsZA9vPxWz89+9Nch+Ky150nVjM2PDSzaRL71Zy2vCQLIHGP3EPhTwr5vsMyaTMbDHS
         BOX5vudGebJ2GLUSedYVgT0/FLh531bKQzaLLGtdwCe3irWWsCM0Zi1SBecxdBvqiU26
         y/Rg==
X-Gm-Message-State: AFq9FYIyA1LLEFGY08GJzMA+bOToneT8nS04jY8sOUV88/fotzC9YOPY
	h3qMh08//xu+d0ZYdAXV3nHCAyrfNQl8ZusUaxkjCHzugGpBjKLJh+qv
X-Gm-Gg: AYBFou3OYoSqgrW+9C7ko+kWPPyn0zL98n+ov6babjmNYDbxtk0lb3qv+GFyByS5r7Q
	gCIgqoYpJJSrBNjJIeimQA4bR81qoVLwtsBsE8BdkND0TrnN5CqxssbcisYwzDq4PxmhJIK543o
	TXJiqCYdiTmIMf+9bgR/dmqnLn3UbLHG2yW1j7DvvkwsedzzQr8HMwNAz1JoMnJDhoI6PF76wyF
	hD1WIjrqebM83Qk0fFFR09WMT86Do//3F+R9lfbzJ2Ma71jdr3AvPzEHrHhQx6tdJNj4ZkAlcC2
	hVzWTflalfG7gvh0A/o3iz/VE0mWTSRxiOrjWFMSBxrMLISj3ei7msl4urxPVH0IrEZ5AxaPxc+
	wZJe1GyqOSVtMjWbeaKKpusMEr6WcLB6qGA6ExkpRZUkViSKyXJTM91KEMv/+88lPf0Knjhq5z8
	r8berRfXF5ZBF2Bj/8lMbV/JfXQ70vkyyyJVTlLMg32oC1n3MFcO6oF8aZ/xjQMVr5CZ8woSRxF
	a9gxWP+dCAHyug+xzLj0JUxiPKdQO9d2Eh85jjfYCF78ZyuNyQGAHcYzocNe08FQBqDfp82095a
	OUVTeQ==
X-Received: by 2002:a5d:6a4d:0:b0:487:1256:ab80 with SMTP id ffacd0b85a97d-48e264f2c50mr5489039f8f.57.1792616895401;
        Wed, 21 Oct 2026 14:08:15 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584c374sm7179196f8f.58.2026.10.21.14.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:08:15 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH 0/8] {unix,socket,bind}.7: General Unix Domain Socket fixes
Date: Wed, 21 Oct 2026 23:07:52 +0200
Message-ID: <20261021210800.27338-2-gnoack3000@gmail.com>
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

Thank you for your reviews on v1 and v2 of the still-joined patch set.
Compared to v2, the following things happened:

* Some commit message rewording (especially quoted the kernel code
  more directly).
* In the Abstract UDS scoping commit below, reworded the subsequent
  paragraph sligthly to avoid confusion with the "namespace"
  terminology being used differently in adjacent paragraphs.
* I removed the commit that changed the wording about Out-of-Band
  messaging, per Kuniyuki's suggestion in [2].

This patch set has been produced with the help of a LLM, which was
helpful for spotting a long list of inaccuracies, comparing the
documentation with the kernel implementation.  (More details in [1])

–Günther

[1] https://lore.kernel.org/all/20261018173712.27670-1-gnoack3000@gmail.com/
[2] https://lore.kernel.org/all/CAAVpQUBh+J-aBLbkpzT7qmt7B714O529HWcTuQsVLT4wLBnDJA@mail.gmail.com/


Günther Noack (8):
  man/man7/socket.7: SO_PEEK_OFF: This option is no longer specific to
    unix(7)
  man/man7/unix.7: SO_PEERCRED: Also works for SOCK_SEQPACKET
  man/man7/unix.7: SIOCINQ: Document behavior for SOCK_SEQPACKET
  man/man7/unix.7: Explain Abstract UDS scoping to the network namespace
  man/man7/unix.7: SOCK_RAW is accepted as an alias for SOCK_DGRAM
  man/man7/unix.7: ERRORS: EPROTONOSUPPORT: Protocol 0 is also accepted
  man/man2/bind.2: ERRORS: EACCES: Write permission on the directory is
    required
  man/man7/unix.7: ERRORS: Document EACCES, EAGAIN, EMSGSIZE, ENOSPC,
    and EPERM

 man/man2/bind.2   |  4 ++-
 man/man7/socket.7 | 16 ++++++++--
 man/man7/unix.7   | 75 ++++++++++++++++++++++++++++++++++++++++-------
 3 files changed, 80 insertions(+), 15 deletions(-)

-- 
2.56.0

