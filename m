Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854363D88F2
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 17:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345068; cv=none; b=dIyIxlDycaQkX9PsUknbPfsm+b42xF+pd84meP0uwqDduN2Y9b3rZLiXbI8gOAYUpiKZUHETVQQF/z+vxyh2CF0meRnbQ2yif1QCe4wv8buiafgbaRBwwNTuxde3pBQnLrD+RaFxaBCmpFrM/RPBTm5sTdUbnqW8SyQz7cTneBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345068; c=relaxed/simple;
	bh=pnAn9EuBGd6fk/heD5fTt61RaAXFQ70Jwstp28GZCNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P2aCHq6YyETSfbXsq4BwzLqbh2ehy9ng2rNTZ3gd0Z3yH7lA8GIcIW6mmOuYWsxUSk7H560uKrrMNf1EPekTo5a72YK7HiN9tnkF0eUbb7l0HgJQxeGxZYCIouNfgOodIF/GANFeiJlF6ATDEBeQVOFTysl79r9TYs0uSgA75OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCxRnZJF; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCxRnZJF"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1e3b87ac5so3829265e9.1
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 10:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792345066; x=1792949866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uGUNTHou1oDfLS3BnuXjUcGAY3xUoCOEEO+6Y7yQKH4=;
        b=gCxRnZJF0sf4/wmqLL56E3Xke5yXU27hH3JBlGo64yFvsEKtHB23UIt5tnJJPE7DGw
         YcbTB8Jr6Wb1qvmVKrVYvcgUKiGpFdsqjOhzDX0nD1TR96JYO8CD9KSEJ/YoQuKXxZJp
         CFDA4xT2kaBvvOtAJMS1JUh7X+0eZcFNSZMhuytKVk2lS5RsadPGZUNzUTER6AGfPPAF
         BInEMtSNUVVuD5PZU2tylzE5fhZVFqQ/3ng0xlIYhUqYS8iGPtJQhNCWbZTZhgq3CR20
         5gCxQxwbDZbAokOEoPO8uUrsdIeU3+RakM9Vuu5JQCnDRUVvbVGYuUXPEvJNjGbBsvlf
         3vhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345066; x=1792949866;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uGUNTHou1oDfLS3BnuXjUcGAY3xUoCOEEO+6Y7yQKH4=;
        b=0afnyFSr2DuKfqmh0UHTi0CtHPBMTW1KuJW/fMmI8oPHUe+wrPZHzjHEofKw7Ods7B
         +05bUVOPx3XoCi4SAVbUFj+dBfEfmTeo5AYhlXNqUBFfyfDDAWL6eoQprZLnbnIB86mP
         fWo6t3qWrf4uiYdwgMWX34P/dRcu92euVtMeddVIkrJXs80A+ZXd/CeWLaq4t9ejapkz
         d0RYCRzcign6dhhvilOa8eqeTcgwVjoE0R2aEqhtB019vBjcV+q/crnobFeiMaHRyrK0
         iDlycJSgVOCoTh33bs5+WLGG4pnsv6KeldmNRkjoSUzpvF5BhoSgVy/Shi6gutvAky/3
         9/Tw==
X-Gm-Message-State: AFq9FYIVZec/fBxnXV9cY40gGNAsywb3LtROC3y2qHJA//J8D5Rvun9t
	Gx7sms12/x78bTI2NHDX8hBg8854AvOnHiw+Ui6U0okNiZ5Op4CX6CiJfONDe8nV
X-Gm-Gg: AYBFou16O1v/C5sjWv1zqO8WADp3HLIWRG6UgmuTQja/cvKBYuTKcP6V1sp1JMb5H2F
	dpbtlpQO3aqpsSP3yYOnE3yeTgKoRWngzzKjMS58/zMKF0qs32qlMaFOsBOubBKEEwCZc1vQMtD
	M4vgv2hB6/h9/oGtcPZ/XWUDnc0yksbuYBOcz+2LkPcBsvLlgO7ijz0p1m7nB1GQPZ5Sr0UXgzr
	87Mn7QwIMaqDne4TxsNyaCZ+L9f/j63uqM6uNt2lvZyqCjSb0lTLQLq42DTPyJsPUqSQ6wOOTou
	JDZaAVDfPgMGs0zmfHLM6PlFGD22bnMdy7ERTyWkl0jrPo4R0ghh/y+Lb+1MQ3zzci4IKeblaQj
	KwCozq+Is99hmjTQAgU1y4jheP39FdhSFIW6p4UOt7GA+k1nf0hmtBgxi8EI8GxIskzMT7QOs8F
	fEP0xGdc6ePV54VdQRfKIX1PV6X6RY0roXhnpVXBAxDN8l+Zw+0tBJlEdf+Yratpa01ltKZ9Pz0
	NGKgicD/Gq4f1f+u4R/Ais=
X-Received: by 2002:a05:600c:548d:b0:4a1:e250:b191 with SMTP id 5b1f17b1804b1-4a1e250b1c7mr45471595e9.17.1792345065634;
        Sun, 18 Oct 2026 10:37:45 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4dddsm17755681f8f.22.2026.10.18.10.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:37:45 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH v2 17/24] man/man7/unix.7: SOCK_RAW is accepted as an alias for SOCK_DGRAM
Date: Sun, 18 Oct 2026 19:37:05 +0200
Message-ID: <20261018173712.27670-18-gnoack3000@gmail.com>
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

unix_create() in linux.git net/unix/af_unix.c does:

	case SOCK_RAW:
		sock->type = SOCK_DGRAM;
		fallthrough;
	case SOCK_DGRAM:

so both socket(AF_UNIX, SOCK_RAW, 0) and the equivalent socketpair()
invocation succeed and create datagram sockets.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    For completeness;
    
    It is more complete to spell it out, but on the other hand, people
    should not be passing the SOCK_RAW type when they really mean
    SOCK_DGRAM.  I'm on the fence about whether this is useful.  If you
    want to omit this one, it also feels reasonable.

 man/man7/unix.7 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index e5cd2b888ca9..787a48baa97a 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -39,6 +39,11 @@ and (since Linux 2.6.4)
 for a sequenced-packet socket that is connection-oriented,
 preserves message boundaries,
 and delivers messages in the order that they were sent.
+On Linux,
+.B SOCK_RAW
+.\" unix_create() in net/unix/af_unix.c
+is also accepted as an alias for
+.BR SOCK_DGRAM .
 .P
 UNIX domain sockets support passing file descriptors or process credentials
 to other processes using ancillary data.
-- 
2.56.0

