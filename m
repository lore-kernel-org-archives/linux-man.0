Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273BB58B6A9
	for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 17:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171984; cv=none; b=gt43rRihhSQaWH9HBf4iXrYkaZGVAXzHUUNcNY+pl7GXX0TVct89LvmvkXzbznSppGu5jVvwCl9dyZEuLXxynbtFV0w95Ev+ghhCwdVfv8Or8PSIIXkHQ866GMQtpUFIdtEl9z/5W04yMYu1AJsF39N5vs6hrHlLin4tvQ9V0pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171984; c=relaxed/simple;
	bh=51uSu0wHQG8Xtddu9Km2VFu4YAwBjjjdEhP1fZ92eDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p7jORykzXakS9MOIni6sxx0O/oYwk8MmvgOElE1Df1MiVua5aAxJklNe7zv7WUw4WyQ9a/nl78UZB7JwVRhrpKyIG3fnbEpJFR/EhoPZoeO4VELouZwDKcPNO/U8INua1JS1jqx23bErdkGvi5clzA13aNKazOMjBKBquV8qGYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DH5wET7j; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DH5wET7j"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso1829105e9.3
        for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 10:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792171981; x=1792776781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LsT+M0WMSgWQPzf87Srpqo6zoBEXwtWX3EDN6L+PQh4=;
        b=DH5wET7jFPmFe5mpqVhztw+PPHD0QoaLYQXSjUcEkj+V9oCsQ1Dhf2Wj+gGzjQjKPh
         3egLDO5f8nmpNIHQpXKcLrxgIZ4Q03j/hyk1aeF5R3PXXZpHcUeLzeqjf867lepIWRNC
         51QdU2MZLm43ZdjGQQh9FhgIF6JVb7tArdMnGffxEC9e1B6IJJItp57nCTQHFl7HU45y
         5byk5jJMI1sbaHViL5D5N4OWeM3hr0wmTRi57qQEXWX8chdYPc1m25M7o4SBM6w3c9zk
         Jv1l3JMkcLTLQNxk8Ik6+87inBWgicGlJzu//qyAKEn0BHMAKC/vTVfu/5MWJfuR+dvq
         79QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171981; x=1792776781;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LsT+M0WMSgWQPzf87Srpqo6zoBEXwtWX3EDN6L+PQh4=;
        b=wJi/tGXDIR/L+cLP2UeCKrkYiuVLFaG4iGlX39AeTEhSVFLF9zLze5PoILjA7eVGrL
         +8duQsAx5w+xCyVZL1yPPw7H2v71B+dW90PXX3obDxbKafrg4xWPx3r1DH3Gy+hmG56n
         n5e78UeBqs7Ki3zjOKlGslnn6hD3HMXZi2e32axztKlNgUoKUOGrUQ3ku/Vs6Uvo/4iy
         pa9t0GWRgo/YAufYXeenM6W73vJzZRibjM12OVjQXWlsn6z3pSwMtMqqq4TlA2hPSqyF
         mrrObZPKia2hlDLPpg4D+MI7al+DuULcYtWi3CflhJGyYre+8BwuFbOQI9CBu3cz0YSj
         9zGw==
X-Gm-Message-State: AFq9FYJWrvezMa7Wp+2jLb+GutTBXyng62lO2yoaT0S4fWJQaCh9ZROo
	lT/2qy8JSr4ku4VsmvUrMHFSzTJHaw61Faj73D+Mg7NoGPKNUJ0gBLFQ
X-Gm-Gg: AYBFou3QcDLmHsoF0sRdIkOcwM0XQ9zOTwXq8lIbJDigWcpVBIHoWDlcHjWOerQtMlP
	kHnjBWZjAsTH8bn7ndeQnafp0REpCM9C2MExg0E2PCuLKoVjKwCmy4mINlJOgSiP3qgpcmIVUNG
	HRiKfhrLXgXhLNnDR8IepCXBugfN/ytA2rSAXZn2YHUFy6f7VF7muTcXnYdd9TjiQFSfJTCAAcc
	EOzjO5cONYg7OMwHIxS06wotf0sQnxfRvf/3Hxj+uNw8oywrJ6dTCHImqxlo31A6so7szhfLq1l
	3oICXV+Lch3J6g0+fvN/29uwBBdHgwih7K1wTmxYk61lSOnZEWhATztIby4LxsJ67x0oPi5stne
	jO3TeQ2hEXSVxysEWccC9oA+6e5cZz3pJAYnv0fWk5nHOZQ2zcXa5xQc9cTePgwsHj7arRJO7uV
	S0EUzLAA/odDn+tyWyA8LZqbvUlK798WrWHsqYRqjsk8PG1F4UqfurkX72rBrA4aIsJN1lDzxuh
	pMzU269n9C9BeekQ3pr9/Y=
X-Received: by 2002:a05:600c:a085:b0:49f:c1a1:5222 with SMTP id 5b1f17b1804b1-4a1d762ba65mr9538015e9.33.1792171981346;
        Fri, 16 Oct 2026 10:33:01 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ad6252sm101994105e9.5.2026.10.16.10.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:33:01 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH 10/24] man/man7/unix.7: SIOCINQ: Document behavior for SOCK_SEQPACKET
Date: Fri, 16 Oct 2026 19:31:25 +0200
Message-ID: <20261016173139.13076-11-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016173139.13076-1-gnoack3000@gmail.com>
References: <20261016173139.13076-1-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

unix_inq_len() in linux.git net/unix/af_unix.c handles all of
SOCK_SOCKET, SOCK_DGRAM and also SOCK_SEQPACKET

* Document SOCK_SEQPACKET, which sums up the lengths of all messages
  in the receive queue.
* Restructure sentence order, so that socket type differences are
  discussed in on paragraph, and commonalities in the next.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    Double checked in code:
    
    unix_inq_len() first rejects listening sockets, then has a case
    analysis for the three socket types.
    
    The LLM initially just slapped an additional sentence into the
    paragraph, but that was mixing the socket-type-specific concerns with
    the general description -- I split that paragraph apart so that we
    have one paragraph for the three socket types and one for the
    socket-type-independent description.

 man/man7/unix.7 | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 8fd29131ce48..4d431ec6deaf 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -606,6 +606,19 @@ can be:
 For
 .B SOCK_STREAM
 sockets, this call returns the number of unread bytes in the receive buffer.
+For
+.B SOCK_DGRAM
+sockets,
+the returned value is the same as
+for Internet domain datagram sockets;
+see
+.BR udp (7).
+For
+.B SOCK_SEQPACKET
+sockets,
+this call returns the total number of bytes
+in all messages queued in the receive buffer.
+.IP
 The socket must not be in LISTEN state, otherwise an error
 .RB ( EINVAL )
 is returned.
@@ -625,13 +638,6 @@ defined in
 .\" That number is normally larger than the number of bytes of pending
 .\" output.  Since this info is, from userland's point of view, imprecise,
 .\" and it may well change, probably best not to document this now.
-For
-.B SOCK_DGRAM
-sockets,
-the returned value is the same as
-for Internet domain datagram sockets;
-see
-.BR udp (7).
 .SH ERRORS
 .TP
 .B EADDRINUSE
-- 
2.56.0

