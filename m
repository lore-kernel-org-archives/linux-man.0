Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4966E3D88F2
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 17:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345056; cv=none; b=jBfNPpMo0xiZbyElV9ByfUqMqgY1ZYNYW+RmSoGlF2+XJ6OU/JT1+jtI2Fviz5Vw8+Y19p4/1YSetqlAy/KgqMbBN7VtSfPfmxLKVs4dknGk5cv0U757PfeFOzLIP2yFthPxdzZpxnr3jzKtJ4BIvyZf4MPXm43c5EYUZR/2OEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345056; c=relaxed/simple;
	bh=51uSu0wHQG8Xtddu9Km2VFu4YAwBjjjdEhP1fZ92eDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uPcxnMGrs93dD1QDP3ZgE1MtaefVWKTu7zEBvCDeQ9XuNUWitAyJSf0k54tQsXCbXn6QYlOGCG/CoNvRtSDLHKsdPtahOFgERvJamQ+27xB+tVVTR6ngdLllY71+KNAT/QUPlxCglHMRwUWxDQlaGcIkPgKafFxzZ2IHlLXgqbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngShS1X2; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngShS1X2"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so12143405e9.1
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 10:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792345053; x=1792949853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LsT+M0WMSgWQPzf87Srpqo6zoBEXwtWX3EDN6L+PQh4=;
        b=ngShS1X2yF5t5Bxq10hk49em6CrydhmpvoecItSiUMoXGnvzBMnXLDk658gqSLq/FC
         4KOEWLWLGcXcG3CvlxYAb1H2VMESNoYL5jqCx3sJELPq5Z3U6K0O0gUVAe6Ts8PerHyb
         i2HfhNygmofNbkZ42+TLg2matR3HrwpOIQ6QQOeGzRJKQyBGLP1SDldiHsxtxCHu+0wh
         65K0DLDxLth/Sbm2/gsB4fgK2Cm8L3v99MakybrC6x8QjJNQmtjEeWO+ntnnKpNbPF80
         JozQfCeZE2m0WxIwCBoZ1aCPpZv+8eG6V95QXJlOBhcJnreIiLTH17e9sKJ2I4fpM+je
         Vhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345053; x=1792949853;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LsT+M0WMSgWQPzf87Srpqo6zoBEXwtWX3EDN6L+PQh4=;
        b=BohgpNGZtp0VeS3e369cKOoE56TbSwS9cSIsNlAUoU/v8Tv3hnHNwLNFBbJtf2n6y5
         DTOfMkljosqm7goJzZ+Mfm4FXRHecXiE3ALSEQryjugqP0j9mkJX+c31XK5oXSkjLiIQ
         ibG6mSVEggS05dAYQrQFcIxMlDGjZFFWaEtutyV4KDW+glKM5ZgBc2xQEvyGocEz64iw
         Z6PpKTNRReYbd9mQmx3al5ZZqRzGBwfcqMV+t/gOvMV8c5GFZSgZYdkjE3Lbir6yPe3s
         FiOheXy3r/g6e79U1gDG/0p8OGaw6MX7Ba4AGkLAQfC1gPLaJFgP3WItxP1+GvOgkST/
         RU4g==
X-Gm-Message-State: AFq9FYJ01BiC/FXJONHE23OIb1x1f7ZvHGSy5btdOtRf9LldWRWFeMP+
	8sD700tG//HIO4BskIItwurhCRjlMVQrhVPtX7kW+JCwQ0skEltUCLUj
X-Gm-Gg: AYBFou1UpGd6q859MRnHXXIVBxa+Kyqp1r51KX2iCwdT10PIao8mMhjrNkwRKkxUO7s
	gKWC+1TWOpTPF7h3t2Mq3ZhknYvdBDCmwHxqUdy+aOW12rf9RTJCf9JlV+gQdv2fhZB8KIx9DGP
	lwfohtHxo2ggHA6Fg3O92AtlQKXETi5FM1x/6FA5KafN30V4tsAnzwYciJ42A6Ov5t9yqxi7xev
	wouCRym15gjpMc6mjcMABhBX5GACZuigVaEyZ7YJ1c9A1OL04IjS8uEi+yNeRBfS0reTboBa/FN
	kUwcLwZIpNCzhX4wDN2Kjud326hgyQSt9tTsLbFzxICHHvNOWpUE8IV0BZRnHccOsufWnV7ooHc
	EvwUu/OYvzWFVVdf+LeaS3kB2SPiVIIPFehkSChTYNTLS1KKPIJhIZExga8Pcn0Fj8VSveoJILm
	a0FdtmhBW9DEDu2mw8qkY6k4EkAMiQhEsHXFDPgzs47Sk90yueq/Yui9CIP3QTlHGx3Sg0O30aF
	bh0U8oobmgTEuw5jHgNa0Ah8L59+7E9Xw==
X-Received: by 2002:a05:600c:1c09:b0:4a1:df2f:ae8f with SMTP id 5b1f17b1804b1-4a1df2fb8abmr82317975e9.6.1792345053524;
        Sun, 18 Oct 2026 10:37:33 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cc642573sm174214145e9.2.2026.10.18.10.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:37:33 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH v2 10/24] man/man7/unix.7: SIOCINQ: Document behavior for SOCK_SEQPACKET
Date: Sun, 18 Oct 2026 19:36:58 +0200
Message-ID: <20261018173712.27670-11-gnoack3000@gmail.com>
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

