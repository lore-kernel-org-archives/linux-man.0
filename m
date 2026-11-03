Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737321;
	b=n0f/ln1Hd6rcjXb5UxC4RzHZO7Vw8Aqu+/OdQXqDxLifqEE8qI5rSJ8Ru//XXLvhRHMS
	 FiHsmD331ct5pJTlCCTUxld6QYHkRXR7JuUxXi+/2G+1Lkdt6cwShjWbAG3IMgqMBNAUs
	 L4Ocp1aT9r95WEC//oLsouZg7nNgovhshYQseyxM15SBW9SSw9on1rvWv5UhllTrTW2nV
	 PXNSvzNWfQ0ER5068afGK7WNic2MJUQUWvTV/t/si9yyajJBXWCm1PUwmcDxcfldOjLh2
	 DyVuWDlMPK7ysv2JXDKAliRdoarPkkqagkCDfSbK/cjggAE2R/LvdYub6rOUQgmZHYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=QBfgzyzFWMgBMv+ry2R017JFjLYa5yKUJ35LlaUj2fU=;
	b=K4xYMIi0i6Bu2PfTaF1HFYAP2ssK7RIoAx7Gd80ReJ5SLq6FYr/vxI8EeXXK7625iRN4
	 cj/9aC96PEmrPXiNQtYiY9x9+9vb6XYjgZUgQDqak6lWH9di6xpJZHPHv9nQwmMoZSEx9
	 DQ2yGeWAA7BKttPE+dzt0KExKoNVSKxCIEfBhg6aDDtw/cStB2qLZ7aay1U4H1YrAxACY
	 OvNfHLx9b1VOGR0XFaKcQfDp7kfCH8twVjCGnSx31bK1eB/g17n6R3TA/l79fz8WIcSkP
	 A5lS+JHaz1AxcAQny+TWGfAGWGdQ7Xg+VXXkvaSxgx9Qem2w/kvfzfnp/zhvjzGMcOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EVwva50x;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C451606A324
	for <linux-man@vger.kernel.org>; Tue,  3 Nov 2026 20:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C451606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EVwva50x
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so3599764f8f.1
        for <linux-man@vger.kernel.org>; Tue, 03 Nov 2026 12:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793737320; x=1794342120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QBfgzyzFWMgBMv+ry2R017JFjLYa5yKUJ35LlaUj2fU=;
        b=EVwva50xbwcxLPG6+QVZfIsS5MGAW3aHexjqx7SijAC3KW2FSHBvYP9LtgXpEzy4kq
         CEgkav9YPZTgvVuQQS6pV22X4Qb0QnSCYhTgw1+nBCRD3XCRjIxShJsjrX1H6SBmEjOZ
         Hr95I6LFsHxqJZAoLf7wJeQv0Ku6NZUXla+V+3XOjMdHFUO7rkYhnpd3Gu5AVXn8TbTu
         v5IBoDM6TPVruIXiHcyrHuoTWYfgDQKphmP98A9plUf0uESCaxG31S1yE0fk+3RE1rOf
         XuE9bkljtDjbyExSMHDTokdDuD8Kd8sF1AtNmK8r7jQ/IKTi6iT79GqzLQhsfWTclXDw
         qbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793737320; x=1794342120;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QBfgzyzFWMgBMv+ry2R017JFjLYa5yKUJ35LlaUj2fU=;
        b=niD/bbUfZA46vRhyH9EFIslDLG8Sar7Q4WxElP+kFO7YIOkQhrbHImztLlqZWb8SDZ
         OLyX0anPetBLyPD7bZyNaA98eJ2B1q6bYU714Dpftl6yb7iooNFZv9PWqskzbxjw6JGW
         rzLD80WMkxKixwY4kCwIEeckHw7UUz86vv0OF1v0iC9IW0HWBGOriiiNpPTNOKVyUXY/
         rClnEbRWG8CfTg9L5QjP1xVYWNPG0b0hfCa7TyowC4CiFGwMwnNkWiME8Z1YZlEb5lQc
         1YPAtvF/DZ86Tl268MqPTQYMLK3fPhDleQ7Ou0rlngvwn1PxZTdo7lWYLhEWbwysMIkH
         hUdQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2TCEwVjs57h8SXCuN0PFn9hbgccxS/MdzR8ZbLPAAJyc46oTcqQ8tSzuitZkY+IPriNcQCLrPckY=@vger.kernel.org
X-Gm-Message-State: APuU4Z++q9ABoisbJ/m6dKcZIqOGF3oICc/07s1k//xUV86JRxN1n7SZ
	kUE20bQU4FHeyliJ9lcwUldplA5nocPsWLjBnEM1qeMTYM3u80Obg2HJk3vpQ9nH
X-Gm-Gg: AYBFou24xcLiDEOrU1AaVeNx3z8LYEzqxuZWTCgmX0If3AhrKchfbQhp8/uzJMEkSdD
	NVxgjqxFcz1+oEo4IXI6fwtYz6sltFutJZYsnOUOewjuNO69wkNZMmNxNvWyNtXVm7SbS9f1WwL
	q8qGxfaTFRvqj73hPyYlIYhtYLSZZpjDTUYURVZAMh5zO3/cTMlD7oERKMgfrahD10uq5W0IWRW
	dostLWg2CM477pUy+BPJGPspSXksEE7MKCVvRQrL6Z2hawfcsNDXkMe3fwWCKZvel0zJ6jS+ASc
	X+YDuqUuXn4UjnRDvx7ytksUEYKC+Xam8pQFDgzqkhAtJAOEiOoZUUVpWOi0V71Neu9zUgyw9uB
	OBLRZ/UBN20ou/M87KxiJiQdrACAADeLqaMl6CEzzQbfuG66UBTZ1PLOAyrnx2omw8tod/6T0qt
	o9Rxjd+qbDC9gANSDjYyViIyMjXU5qttO4kW9Y4cWe0tTXonB06+S5Y4VediFBua2ygqdd4kafj
	/npaM5hw/FufNB80h98KBfWXn/0gK8S35uweRLfqw6HjxRSh06EIRHa6HFZTbh4T+0CzeLK7NTJ
	k12EXyAgZeTAUy3PYDzV3zYegHMy2/Afd2mn+rNvJYctSKdEZUgl5Q==
X-Received: by 2002:a5d:5f88:0:b0:48e:6419:dc6e with SMTP id ffacd0b85a97d-48e6e4f5431mr30964963f8f.16.1793737319683;
        Tue, 03 Nov 2026 12:21:59 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fc9d6b0aasm556957f8f.2.2026.11.03.12.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:21:59 -0800 (PST)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org
Subject: [PATCH v2 3/6] man/man7/unix.7: SIOCINQ: Document behavior for SOCK_SEQPACKET
Date: Tue,  3 Nov 2026 21:21:33 +0100
Message-ID: <20261103202136.13574-4-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103202136.13574-1-gnoack3000@gmail.com>
References: <20261103202136.13574-1-gnoack3000@gmail.com>
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

Document the SIOCINQ behavior for SOCK_SEQPACKET,
which sums up the lengths of all messages in the receive queue.

Restructure sentence order, so that socket type differences are
discussed in on paragraph, and commonalities in the next.

For reference, the SIOCINQ lookup is implemented in
unix_inq_len() in linux.git net/unix/af_unix.c.

This function first rejects SIOCINQ for listening sockets with
-EINVAL, then does a case analysis for the three types of Unix Domain
Sockets:

For SOCK_STREAM, the result is:

	return READ_ONCE(unix_sk(sk)->inq_len);

For SOCK_SEQPACKET, the result is calculated using:

	skb_queue_walk(&sk->sk_receive_queue, skb)
        	amount += unix_skb_len(skb);

For SOCK_DGRAM, the result is:

	skb = skb_peek(&sk->sk_receive_queue);
	if (skb)
		amount = skb->len;

Cc: Kuniyuki Iwashima <kuniyu@google.com>
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    I double checked this all in the code, and quoted the code.  Both the
    commit message and commit body were substantially edited based on the
    initial LLM-based version.  (Nevertheless, I would have likely missed
    the inaccuracy if the LLM hadn't found it.)
    
    The LLM initially just slapped an additional sentence into the
    paragraph, but that was mixing the socket-type-specific concerns with
    the general description -- I split that paragraph apart so that we
    have one paragraph for the three socket types and one for the
    socket-type-independent description.

 man/man7/unix.7 | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index d0c1765dfd79..c370b021589a 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -605,7 +605,15 @@ .SS Ioctls
 .B SIOCINQ
 For
 .B SOCK_STREAM
+and
+.B SOCK_SEQPACKET
 sockets, this call returns the number of unread bytes in the receive buffer.
+For
+.B SOCK_DGRAM
+sockets,
+this call returns size of the next pending datagram,
+or 0 when no datagram is pending.
+.IP
 The socket must not be in LISTEN state, otherwise an error
 .RB ( EINVAL )
 is returned.
@@ -625,13 +633,6 @@ .SS Ioctls
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

