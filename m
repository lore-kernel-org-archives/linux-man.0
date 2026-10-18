Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AE23D88F2
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 17:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345058; cv=none; b=ZZSl7gRCgHHEcfudR/Qx22LEhP023idS1SP4/j3pIfRBjsYLVVCMoqz952SweTiPkQvwCQVqiP9eB2yjgo2tSq271TQjb5qjbDdl+LWK0sPJuqrz73BcjPhqWlYaNh3/p9WRCwADtWnA5DT3djvANVZiOvbzfnrDhMTZN32Jypo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345058; c=relaxed/simple;
	bh=0TnVsez4A4Vg6bk1Ah6OsbIZ+sfvdktGax083JWkbu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NS6XYTfpTLQsFYa8qYYJhov6eLjxWQPLmqu9rJK7Zs2iqKuGowJ6hp0ITQrUt6XhADktnCXjePoisBCCVdrBxDDNtXfeVi9rj5+mO4DqK155y4C8G9VmXHhIMzt16YxtdYWAgG4CREABUX7RbHgJOnuF+AIlQf9BzzIdyuz20Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQO5i5Ur; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQO5i5Ur"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so17652725e9.0
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 10:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792345055; x=1792949855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ji6fkm3xHwzcDKWVifSh8vxcxW7Goy3WqFI3cO/LTj8=;
        b=PQO5i5UrWrFSVlHDgQNjeWN/NdqL4FslSl2Z10WPK9XaRnA9CgmFblIH1ln1zSsCRV
         /RZKI86aRlAAIgwfpXv6g/2Hyqo0o2xM7gfquudZc+HmltfJ33Viw5GE14xzwSeu/B6U
         cGPDa+mIcYWEHI61CWG3lI9QQWzrqF7sMZ7B92Hoau8oggHUlo/goBxYnwizGEBpUvxn
         lq8r0LOUEmDSFP9GTG5wnXkUJjXTSQpQDphHdKIkmCrtESs+QUM7lzMAoXsYeiql3i3j
         iGOKlZlyK+ofxh0FTYXHg1pVO37NsKRCzRtK+L3RuuoNqBjZe5mHO6aE9wtHoiYDVrx2
         Qr5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345055; x=1792949855;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ji6fkm3xHwzcDKWVifSh8vxcxW7Goy3WqFI3cO/LTj8=;
        b=JcIrvLorVtHJV3JviVQs8ia5nZxSCHTtWzFA6mJjBW8rirFzv+RCFSuuNQzPjqmD7L
         bIJSLHnlZi6Iezox8NMY3k9S4OCZEQC4urILFuWRuLiy39/vhmk9EcMDCa6W1mqyN/OM
         MgSCx33/1on+SiT91zjljnoY33T92IMlCjLIRIHKVB+6snUCAc1YP+/rnZFCoUH+gXTF
         C0g1r2/mnf2+hrT1y18SaEIbr8AndEnIBUic2tmhtCUwQ2knsDemN753TjXM939KE2KM
         sXEB++N4A0cTdlCCGpWtjL1NpTF7ZpaxG+RK6gDHeWzkh6e7CtgVEgvQRPcXHjTNpOTg
         p2qQ==
X-Gm-Message-State: AFq9FYL78Jr+ZMbfDaQ7YCatVTKsnbPCz4uBZKLzb6xcDHEkifAkq1k8
	/foLNCfMTNydqF6qdwYQoT78QPCdJXPedyo6OvbbzXF0UGwfo3vYpu+4
X-Gm-Gg: AYBFou3Sqbpswlu9qulV17BuqenMxtdllPjZEW+wJJAUT0+SYCQn0PiPliPXY87O902
	rkflxJwhmClHvBHEFoTwAJmr643wYoTNHTjmN8+Pnwusj6QqaljrvNYRJ9u98Kt+wTeAe7IpUji
	Bh1MMxeovaMnCWnGgUKVX9ez+8CuG/sXl8zVwjoRQYzKcZB3kJ/JbSSQJbrJ0bF1ZpeSxSuKJe1
	ez0aXNX/8BlySadiRn0AahT7RadyU2uMIkWSyRKG0GMFMLiowK/Fs7u4RKeVX5Ku94LLfB2Tr1R
	PKMWTGqbI9xwxa2VVc9KkuJHfgw3Dr00xI93g27JlG9AeOs461hiV5ceeLP7N6r2LW4mxsMe7QC
	Enjz70hdh9vTq81HZblAkjC7nWaP5fjgUuTxQ2DUNcEHYFgp4aJRC3Rvr5UDPKxpSx6RIEm/Ba9
	A8Q+3PKW8zPi1nWn0Ha6y7ItkDWdZUETvNDYYK8lYVPBGg7uUIACsF2vriqyEHqhxDyn22ANGJS
	yjhSejvp1K7yOrJVNCJFWo=
X-Received: by 2002:a05:600c:6309:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4a1d7634cafmr116018925e9.33.1792345055269;
        Sun, 18 Oct 2026 10:37:35 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm264515755e9.12.2026.10.18.10.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:37:35 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Pavel Emelyanov <xemul@virtuozzo.com>
Subject: [PATCH v2 11/24] man/man7/sock_diag.7: udiag_states: Document TCP_CLOSE
Date: Sun, 18 Oct 2026 19:36:59 +0200
Message-ID: <20261018173712.27670-12-gnoack3000@gmail.com>
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

UNIX sockets can also be in the TCP_CLOSE state and it is possible to
query for that with sock_diag's udiag_states.  Document that in the
description of unix_diag_req (for querying) and unix_diag_msg (for the
response).

The implementaiton is in linux.git net/unix/diag.c, where
unix_diag_dump() filters on 'req->udiag_states & (1 << sk->sk_state)'.

Fixes: 4f6a0a4a909e (2016-12-07; "sock_diag.7: New page documenting NETLINK_SOCK_DIAG interface")
Cc: Pavel Emelyanov <xemul@virtuozzo.com>
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    The full list of "supported" states here is technically more of an
    implementation artifact -- the supported states are simply the states
    that a UNIX socket can assume.  So the kernel code does not explicitly
    check that anywhere, it's just documenting the states that can exist
    in practice.
    
    The initial LLM phrasing had added a section going into detail about
    the reasons why a socket might be in TCP_CLOSE state, but it felt like
    that was anyway obvious, and the phrasing was a bit vague in that it
    only gave an example.  I deleted that sentence and only kept the part
    that adds the mention of TCP_CLOSE.

 man/man7/sock_diag.7 | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/man/man7/sock_diag.7 b/man/man7/sock_diag.7
index 8f8b28b4404d..20733cb8c8ae 100644
--- a/man/man7/sock_diag.7
+++ b/man/man7/sock_diag.7
@@ -151,6 +151,9 @@ Supported values are:
 .P
 1 <<
 .B TCP_LISTEN
+.P
+1 <<
+.B TCP_CLOSE
 .RE
 .TP
 .I udiag_ino
@@ -307,9 +310,10 @@ or
 .TP
 .I udiag_state
 This is set to one of
-.B TCP_LISTEN
+.BR TCP_LISTEN ,
+.BR TCP_ESTABLISHED ,
 or
-.BR TCP_ESTABLISHED .
+.BR TCP_CLOSE .
 .TP
 .I pad
 This field is set to 0.
-- 
2.56.0

