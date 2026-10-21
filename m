Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617794;
	b=VLorS1SZXI2zRnkO8g/9CUcoax7RDDITVfy7IzuddurpP2vV7jjTCkokLjXDQkur41vE
	 VLHwX26ePdXmHRKYmV0nYzUZtevaMWMY+segaBbzhAEsb+6j52XWm62LdbGQS4cJaBqRT
	 uhKnw/+k8kZhMQKwQxzeImzCbg0s/71DkdTrqZeLhQiakXZzRx4gwAp6ABFWsLUSWBIfd
	 HwgHFjYEhRi9DM/3PCfk5fY9MWKkwZX/+TtuizyxRe9xL6qUT4KD83iaPAtkdKUDEOBoa
	 WWAIF2mRfks35PNt0T1d4sxZs8/xB7PjNiHy9ZXJIK192h1cEX89owMEpYo+QVV18MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=A/+cX+GemZYEs8H8QaOzf2nbhCEZkvKBe0Nt2lWz4/8=;
	b=Db5pmbXpSTLKDIVU5E2ed8wRYsPgOeF2lc5PMn+sM4+WDOx+81WrDAJkdpvDqVhtmROQ
	 3jVmxJ/pQIwYAnVcFi9VjZgE7aAvxenp2Izh2wsW8FdWvO+M7J8XSVyCw0MeuOwhnkp4R
	 AxfwcFNeI8adgyGitsfDNodyuV/1+zOXQMlHGSc1O95BIR3jbBSSHKT4SGAPTFiwoBAHV
	 /sorMqMTHOuI2eTq05hF385Lw5D+PjF4BziElGg9tgWvqCrL0uaLTk5z9g/CxhRIg6sLq
	 bB3Hf5UoWZLcp3pp+HUuMGH+j12NXGd8tLzQ+ETsaXB8uHqpOZ9XHNVM8vSTnYnn2dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P1g3Yxxz;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713FD606A319
	for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 21:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 713FD606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P1g3Yxxz
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so9472055e9.0
        for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 14:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792617793; x=1793222593; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A/+cX+GemZYEs8H8QaOzf2nbhCEZkvKBe0Nt2lWz4/8=;
        b=P1g3YxxzEs3pf/EF2ZPljXrA88Rz00OkK6L2LtQm+txpEt6OMClC31Atn6kSuBTe7h
         1lFaCoNQ+zcDlpraHbMzOfYL5alhRJ2uYTogO2gutyHrkgrDek0cr5dLDzVuowQHjDAu
         82UoLWMCmSge8cZ32T7CtDvBTjYElGsVZbwkfalXvvYR/Ls7Grr5O4+vuVGDqMmUxGVM
         lITTWQdV2wQbPvSKX7wqKcJ+TW4eNNPKi/gGIbDgNd2tFztDKhi3bXBi7bBOtNZmdPhY
         CLteMTdvIElBzO5fO5cdhQ0RUOs7y9UEVBocRL3afSNssmKs9cQE1DHpQhtM2O0nYJkj
         B3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617793; x=1793222593;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A/+cX+GemZYEs8H8QaOzf2nbhCEZkvKBe0Nt2lWz4/8=;
        b=qKtockTwEUiQQhdpkXMA8uR+uHgMO081yIn4Aekh/hK6g32UU7h/qYAZka0HTG15w5
         pf7q0icjTCEsoGvUMisDXd19FBVb7Jg/Einuo4kjBz7VCZndnY5iSnefUQ84U+dhSXZ1
         hcxsP7gQBIMg5YbnBxcrysBsQsViDrrEA5b4wFatEEtFn0SZFGE8zpyIbT2u7QF2sdlC
         lOkWvI599G01G74opUe+D9yRxCQrqqv0XheUG50SPA72+OXrA2PVXA0Z+zRpO6ZNrHaA
         UoAOqNbQC7YzPUYhlkdvxDzgrxCDl/nSgaOdSHsPCOtJK7I5wwdNpiHW9Hnz0B7ja3Ii
         dKCQ==
X-Gm-Message-State: AFq9FYL/Ru0uogQn2aX+5elRd+X3ydyTrHQucSc23s59dtmfvqthukON
	ruSHiEyGrRsVh9tmCAACzW9ddnWvZHQe9TqvctSVKnjn2dOp/1ipbg4q0K7sXonB
X-Gm-Gg: AYBFou3jowNxG9t+8m/BsAX4O4vnCp+xdV5Ucm1wKY4VIsgN1iIZSUQ6ZGf8eO7eO9+
	uSVltQM+CKGUeY1Ask2BNexV57p6FhTMfgqI02dFYo0NzukMH6VdtTErS8UZPjGC3ck1cXu1Czo
	DvHWl+QC++54J6fg3V8qjGaOxNOhrzIA4AaxNA1dsleokq2Sx79+agK6t18otoBBfO4ACJh4vnc
	glumKMjCRSjbC2U7kdSFzX38WiDEjCjaI7YN92q5s9sofAx/iWGpz7H19eX8s6IRk4QZDUdAdq3
	b3ohXNYb3bOHYEv8+DiwMjKkCvFE1uJmSA/YpMhrWuliMW8MzNTrls0JUWuTbHLWBT48EtiUytN
	yn5k3LGTCPEd6ZMrq+nSK6sWjOXYjNODMFx7JUwiRRyYFX2I6dtFo6vN3nn9IXr4ISLlqrU1a+s
	Vk0qaA32wfIP2rUJgbH1tMwxN8igKYXi2beZlLddSnfaS6cOeDWIZvUh2IRC9irgkQoUP5kZGZu
	HMCtOTPzRAEkf9oKgvv04il84HocEVvWLgxq4kDFIgAtX6o0ww3/Xws0rTvmL/Jmgso/Hi84CNX
	5gcOMvHR/13Z9JTMxYp2m1Nhwg==
X-Received: by 2002:a05:600c:4fd4:b0:4a1:7ba9:da2c with SMTP id 5b1f17b1804b1-4a1fdd4d220mr68176235e9.25.1792617792786;
        Wed, 21 Oct 2026 14:23:12 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203b28f70sm20761585e9.4.2026.10.21.14.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:23:12 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Michael Kerrisk <mtk.manpages@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH 2/7] man/man7/unix.7: Multiple same-typed SCM_* messages may be sent in one message
Date: Wed, 21 Oct 2026 23:22:51 +0200
Message-ID: <20261021212256.27961-3-gnoack3000@gmail.com>
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

Verified in Linux kernel code:

__scm_send() in linux.git net/core/scm.c walks all control messages
in a loop like this:

	for_each_cmsghdr(cmsg, msg) {
		// ...
		switch (cmsg->cmsg_type)
		{
		case SCM_RIGHTS:
			// Append(!) file descriptors
			// up to the SCM_MAX_FD limit
			break;
		case SCM_CREDENTIALS:
			// Replace previously set credentials
			break;
		default:
			goto error;
		}
	}

So it is possible to pass multiple SCM_* messages -- they will compose
if possible and override the previous value if not.  Since their
contents are being conflated that way, they will appear as one message
again on the receiving side.

Keep the recommendation as portability advice, and describe the Linux
behavior.

Fixes: 5b5cb1958062 (2018-07-10; "unix.7: When sending ancillary data, only one item of each type may be sent")
Cc: Michael Kerrisk <mtk.manpages@gmail.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    The factual analysis in the commit message is correct.
    
    I kept the LLM phrasing; it did not seem overly wordy to me and the
    style is in line with the paragraph after it, which also documents
    Linux-only vs. portable APIs that way.

 man/man7/unix.7 | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 0d2ea8bda2ae..a1dce8c47246 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -543,7 +543,24 @@ option must be enabled on the socket (see above).
 .P
 When sending ancillary data with
 .BR sendmsg (2),
-only one item of each of the above types may be included in the sent message.
+portable applications should include
+only one item of each of the above types in the sent message.
+On Linux,
+if several
+.B SCM_RIGHTS
+items are included,
+their file descriptors are combined into a single list,
+to which the
+.B SCM_MAX_FD
+limit applies as a whole,
+and the receiver gets them in a single
+.B SCM_RIGHTS
+item;
+if several
+.B SCM_CREDENTIALS
+items are included,
+each of them is checked,
+and the last one takes effect.
 .P
 At least one byte of real data should be sent when sending ancillary data.
 On Linux, this is required to successfully send ancillary data over
-- 
2.56.0

