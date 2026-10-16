Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE3A582B88
	for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 17:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171994; cv=none; b=qRw0knOzXAOcx3urb7eBppPtg0tA+2IM5GY7B1isXAEXq3shfl0X1Jzc9lcltRxwtGcWfeURHgTlcHGL+65mcBSSIEVDFAUje4WBbtQ0/bhWlYCge47lsvRBvPqwHbyWBz0RAu39D9y7GUoPbqC5i5Kl9Ur4OqpJb+HWde11mQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171994; c=relaxed/simple;
	bh=pdhjUoUgG7E00ja4aPLxeWpGjIhIwP4wvUGuyzk9yxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IP48uZcd3S5Ez8zcmwZAu3jf63xugr7XOx0Uu/qHCnzznbIyqdGSZMhnG/1CQTiiIeEeuvlxiHZEOKyuVFawRNlUyOF1qVfGHSuGvbWJXam+afqOuEEPCRR38GYrc7ut5EMCDT3XbCD4N/nHBWRMBMHYFwrcG4/W1wiYgUFrxg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XNGynexS; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XNGynexS"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48b060ec084so65540f8f.0
        for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 10:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792171991; x=1792776791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iover+myDn2l/tly3X5ieAKIbyQCW9bex6DNPYkbMeY=;
        b=XNGynexSwtMigTRGBYL9yT1rCfHEt8EY8yPNKYbvWKPM5CeO3dBAZ15r9OiFQLXzX4
         08P0BwwDjpKBpA17gdEL5VVR9zS2nM1yhBy52JEx3VmFicGlIIRcJlw+OgDWtiwHNNGQ
         X0K5SnGLZX87XzdH0F7ZhBTnwvKtXo0mycY6ggC8IvOUD6Su1C5SuuXMREtJHL3C5r7X
         FGrJEEOFtPZzudpNLiMKQ6b8yRxPYAgXgD+1QBLRx6J7Xk4ZrX19nbIjCyXCQdcQaxKf
         WaGU43UrebKVx/DAzY7weeZ7QHMJo3fMVYrpL6SqhNqMba5xQN12ESwpkX5U2RRT7TVM
         l45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171991; x=1792776791;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iover+myDn2l/tly3X5ieAKIbyQCW9bex6DNPYkbMeY=;
        b=nwT2bKbS3RfGMoatNRtRSzncZPUwlNnh/kjHSBmNKPDIkmvy9A8++iZ/WNAZ5cT9oD
         mpVjDQPN8HSW1Rlgdzqvzh39qziuRvl1ces6LEhNQN/memX21ns2hh3Uk4qRbf8VMXLz
         gosfW9Qm/lMF8tAZJLm0zz6/Kk1JKFN9/eSzTscSO+zHluDuvMagEIIHfpwjy2JAO82e
         m7nIjgoa6GTrbl4KdWIe+E0iU96VkUPal1kE99InknBVY6P33vWsh1LvkWx4hW9SgnZ5
         KgZNqGoYfHRexBkfzoO0hwb152y3/i7OUmH2NyNGWvIuRJSbgDcK4O60/MwQsJTS75UK
         wxYg==
X-Gm-Message-State: AFq9FYIgmySZTQcmtQgnMV6TR1PflZv55Q3fW32YhwVAqgW2UKfalBVD
	+RXcmh7f6fYuGr38bq+UNXTFlM9EnjPMbeHN9f506TCS/aiZc80SXAha
X-Gm-Gg: AYBFou1u1aB8d8I8CYkBKaWRbqaM6+a3U9siF9W4wNkA7mXlAAlnOQ8H0iZI7O1FKyA
	xdHI6WnLTKUlohJ4FZgztkrTPyVw2aTrgzKRofB1JQh6cAI1pIFTFnAnbkD5p0XJa7IlBC2ay5G
	ttCnrcnrs8JPg+Kv1SuAwKyvRBz0Cy4oPMzkTfomG3dTo4yaWTbDqtQGTfQpFrS8xx+ykvdch1H
	6URDbJjhsmC1ymmEBjz62cSSR2SDW9Po2fpYvAs+yZ9KTol6ndtEcbvFlJv1CVBmiB7QYPyVIgq
	WFIaIGfw/C7/tw6i+loPjgl3qMvohHmK4NBXPEqHoJK8+mM0L4gJ2dFfkwmocAW0leSxaqe0rSb
	YRp2AP+BpuAjzlLbWs7KuSreR4cdleVw99/hreUuv7Umj+u/QPn28KXIDtDvPuLPJfpMBWNVzaf
	z1SWuG8DebigpsgQP1/58qTzQFkwiEaakWBYzEepO4TPv8mrGGLukS0y5CFfXDuOCb13VnUnJws
	YMe7cEoe5a41GtzEW/wlOM=
X-Received: by 2002:a05:6000:41cb:b0:48b:10c8:2181 with SMTP id ffacd0b85a97d-48e07f9a2b1mr534423f8f.27.1792171990792;
        Fri, 16 Oct 2026 10:33:10 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd510ba3sm6254019f8f.56.2026.10.16.10.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:33:10 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Felipe Gasper <felipe@felipegasper.com>
Subject: [PATCH 13/24] man/man7/sock_diag.7: Document UDIAG_SHOW_UID
Date: Fri, 16 Oct 2026 19:31:28 +0200
Message-ID: <20261016173139.13076-14-gnoack3000@gmail.com>
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

linux.git cae9910e7344 ("net: Add UNIX_DIAG_UID to Netlink UNIX socket
diagnostics."), first released in Linux 5.3, added the UDIAG_SHOW_UID
flag and the UNIX_DIAG_UID attribute.  sk_diag_dump_uid() in
net/unix/diag.c reports sk_uid(sk) as a uid_t, mapped with
from_kuid_munged() into the user namespace of the requesting netlink
socket.

Assisted-by: LLM
Cc: Felipe Gasper <felipe@felipegasper.com>
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    This documents a missing sock_diag feature introduced in 2019.
    
    The phrasing mirrors the phrasing of adjacent sections about other
    features.

 man/man7/sock_diag.7 | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/man/man7/sock_diag.7 b/man/man7/sock_diag.7
index 9a2b54a67b30..c82b24fe1198 100644
--- a/man/man7/sock_diag.7
+++ b/man/man7/sock_diag.7
@@ -265,6 +265,16 @@ The attribute reported in answer to this request is
 .BR UNIX_DIAG_MEMINFO .
 The payload associated with this attribute is an array of __u32 values
 described below in the subsection "Socket memory information".
+.TP
+.BR UDIAG_SHOW_UID " (since Linux 5.3)"
+.\" commit cae9910e73446cac68a54e3a7b02aaa12b689026
+The attribute reported in answer to this request is
+.BR UNIX_DIAG_UID .
+The payload associated with this attribute is a
+.I uid_t
+value which is the user ID of the owner of the socket,
+as seen from the user namespace of the netlink socket
+that is used for the query.
 .P
 The following attributes are reported back without any specific request:
 .TP
-- 
2.56.0

