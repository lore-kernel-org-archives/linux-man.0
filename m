Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617793;
	b=dQ4UdQ29/WLsz1GqM0WWntzPj4dFolBw+yWof54Sa3m+txOOBdfjyHdyl8KoEaVUvsJH
	 K3+m5vLhi+f3VErPhZ4zPMBuQAZ5GkZxk07f125eOguB/g+pPsYBcOPVax1XYeayCm3fF
	 IL1gTXsAIJeO/f6pN04k2TYj0JC5Y0PnOtxw0kSacQSPEZOQsgEYlQRqXy+A8ddsBh0eX
	 Rx2OmkN1BRfTVA8tPDSqzG7nMI/7gwVqMkDfaUJzSlnx//YxZ11MfclYQpGI03dbzlKp2
	 Q6ZgBQ/MXSE0SfkBQ1IqcYzKtNw+Y7f8r+bGhRaH22U0qb3IwweRVnA1ZLI9ljdjKsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=qAWXk35J+/aTisKh/GFYqLJzWbPqSA6gO1QNMdvu32E=;
	b=oFMty1kp3F4WHl7OfTjhvW8eCCmxKZg0PVxQD/qZIcS4Ukdl5GFB3R29mICtFcW3Erv6
	 vgiiU7/sYTxezocY1hxSsE+LBrlp3iZq+4FTkW8rhHIEtc3HMxbaLDIloXPlciTCwq3Bt
	 3v8ad8HJYbm9Pdm8V6K6tPjnXSH8D13/dFETHwnG3LV4o3fN999t2F1WjZF+w0/ELOZ8Q
	 VGVrr99ij2LzGBvpxRUTVYsYlOyLYSgibh+S5N+qXYrNmSfREK4Ltb3H9sCzed92feGjl
	 EKqfHc22oqFpzzU+oUwYfX5v+wqkE0OO8wEIh9eEoenGKEBI6pBeMqyXcNQZY9hIFvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lUlSzAbM;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED88606A319
	for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 21:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CED88606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lUlSzAbM
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so6892455e9.0
        for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 14:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792617791; x=1793222591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qAWXk35J+/aTisKh/GFYqLJzWbPqSA6gO1QNMdvu32E=;
        b=lUlSzAbMspwGO0JyzbHcTwuzQQbZ3tFcrsqS4wPJMknJfvKTT55FGeFjJdlgu/ldcK
         fPEctp2tcL3cJvOaNMxR9AsHosoRv6ttSfDcT9tIziaUXQvbUqrlB4wu734GjNE6roe4
         yh5dA0SG1FUOxv3ZhvssCcJByGziZ29VE+Vgh1mh39zXri5mNjS8bUslkkU6pNEfDcCm
         Yo6+f0UrcA/JwdXL8leE1w6JxkI7rtoZhPPI7/aV4u2rP8/LWdAhXhE2JWB9TYE2wTny
         l/O40Hd+3NiM64t+ma3FpR6Y499TJRlzmV+Vrwk0SvklFBMe8xC9Qqp8bjHElcII6GIp
         7p8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617791; x=1793222591;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qAWXk35J+/aTisKh/GFYqLJzWbPqSA6gO1QNMdvu32E=;
        b=LzZOk9DsKYNzwzhvOPHE9eqXdHvPt4fWc+eFCNIXBBumQMzDJwK6d5amdKHHdCMxts
         1bmdH9BY36mWx0BtzsXpfyHYFIDwXgZxGoUtP1CLgUz7sedEIoiOhmiJudsXNfwoC9Wg
         o3LmsbHzD3Kad9r3N8pbvlbFrlXebC1vkIvEnYm2uecwzNUho/kHdnB3fuq7qQt75+7t
         jGd2olEBPmWODAeaM8Bvke7w3CLxktw4iCBFFrdSne4A131jcRyll4qV11IA/57LPQdx
         Iz5TGI0ImULJH7CiJ5Ov0VRyHw08qSTFuCSIWNA60m478dfBaClZ8Wda7Er+97iUxYq+
         g9/Q==
X-Gm-Message-State: AFq9FYJX3bGF2lO74ndAM0YbbSM218+KICej/vsCss9z+mGW3ggVtp5V
	evvlFlSWvqYnRg7x7Hr3roJ0kOKtvEfnNnBAX7ORDNFcR7KZCxmOKQ2S
X-Gm-Gg: AYBFou0wqjJ/R+i+cw2DkaI+hvIIBswI+qiQs02iVuqQPaezxP3TSt/2MhSqCi2rc+3
	gJUOXaVM/Ysh+e7Ujaif2i/xRgJCdO9ZwMRL0MAQkkhRAZ0NaMelOu7riuqygdNimqTndbDV9JJ
	Dnke/Y4PBrcKZv72mzuxv0eeACX4N84RiO37KPfQ/HNNy0Q2XUZp7D2sL0krqpX6ho/lwLOKRVA
	t9z+J88bkpQqW76YxiDTmuxg/kYJKcJlc0n+QWe/ci0ibOkszMrtXPsubdELyBrBECi5cKYrm2z
	TXp68ZysRg5PcWlanIFgi4SGBalKOlgp/FS7t0INgU5N8QPbTDMU8daopS5P6hbmqER6jR9ZXwl
	Xxji1Dpp8gcP0nKv9SMFipoiGy2Sm/Pi2MsLE0Aq9sKkBiTqzgUCJYE1B+EO1gvr7YNX3rapkc3
	F1XjG90GD4w3Sm+XgjkNjNqYHg2/e6bU2ZAAGe9XbWfCUcVJUBSDC0eGuPn8bIeQhhKgvGemfO4
	EiGjH3pqYRC8ow28W76ajN+Dg/1C4BI41jKNstf5q9ghsEbLUDknKjZfoQaWL+4CYeFRbF1aCtN
	yluS
X-Received: by 2002:a05:600c:8b51:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4a1fdd3d413mr66646055e9.33.1792617791039;
        Wed, 21 Oct 2026 14:23:11 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581fa7fsm7438191f8f.17.2026.10.21.14.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:23:10 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Michael Kerrisk <mtk.manpages@gmail.com>,
	Willy Tarreau <w@1wt.eu>,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH 1/7] man/man7/unix.7: ERRORS: ETOOMANYREFS: Fix the conditions
Date: Wed, 21 Oct 2026 23:22:50 +0200
Message-ID: <20261021212256.27961-2-gnoack3000@gmail.com>
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

The ETOOMANYREFS error is detected in too_many_unix_fds() in
net/unix/af_unix.c when the user's (not the processes') in-flight FDs
exceed RLIMIT_NOFILE, and the process has neither CAP_SYS_RESOURCE nor
CAP_SYS_ADMIN.  The error is raised when all of the following
(simplified) conditions are true:

* user->unix_inflight > task_rlimit(p, RLIMIT_NOFILE)
* !capable(CAP_SYS_RESOURCE)
* !capable(CAP_SYS_ADMIN)

The check was introduced in linux.git 712f4aad406b (2016-01-11; "unix:
properly account for FDs passed over unix sockets").

Fixes: dc4eea68b565 (2016-12-17; "unix.7: Document ETOOMANYREFS for SCM_RIGHTS send exceeding RLIMIT_NOFILE limit")
Cc: Michael Kerrisk <mtk.manpages@gmail.com>
Cc: Willy Tarreau <w@1wt.eu>
Cc: Kuniyuki Iwashima <kuniyu@google.com>
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    Double checked in code -- the condition under which this error is
    returned was not fully spelled out.

 man/man7/unix.7 | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 79198445c581..0d2ea8bda2ae 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -785,10 +785,14 @@ when sending a file descriptor as ancillary data over
 a UNIX domain socket (see the description of
 .BR SCM_RIGHTS ,
 above).
-It occurs if the number of "in-flight" file descriptors exceeds the
+It occurs if the number of "in-flight" file descriptors
+sent by processes of the caller's real user ID
+exceeds the caller's
 .B RLIMIT_NOFILE
-resource limit and the caller does not have the
+resource limit and the caller has neither the
 .B CAP_SYS_RESOURCE
+nor the
+.B CAP_SYS_ADMIN
 capability.
 An in-flight file descriptor is one that has been sent using
 .BR sendmsg (2)
-- 
2.56.0

