Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B5758B6CD
	for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 17:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792172008; cv=none; b=QtIjC5v0QJlO5adFzdGRB9EXy2U75mBaqlzwPQ2F9CEqs978nlNm3jnxn3dGX8Epb4cq5ABd8lkcGTiE3LioDB0u+DkdcoSLcM/IkzrEQ0YuIgAXsjr+GEEOrJYBJtDp6xyYO9VdBOG0A0rBcDa5nUuCGQXOfvQRSYpYVkQT7Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792172008; c=relaxed/simple;
	bh=dmrxQM7BM9Bd4vguzjFvfgYJzx8XGoCM5b6iV5mLu8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hHozwbXHBauMjPZGFxV6+p8XbCLg172Cu90V1frMOk+nquESlgfrGr8v3sWPAspF7bAK07Qcdm73mPvVMJd442GzPbVnGGwu3zBFw3AYJnm8Hs0CFbkYCUGpoMNzXxTghTW1ORTKHgub5AgYeVlmdF5xjEUUS14oU21Uhj8Sy8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UzOhzieZ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UzOhzieZ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so68809f8f.1
        for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 10:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792172005; x=1792776805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pcz01RnH2iOdU3rzxvvGuaDXi6K+MOtLfDV1KCE4q94=;
        b=UzOhzieZhYvRDU6nx5mvyRQsC2li3SGlevS0xk5Kh4vrb7YBwPDECWGQXvtwmEE0pP
         08/z2F9ouU2h0o90CqmIO2HQX4AaphWe6zAUKOXMZaHXMDYPdJlEPOx/Og/SB8vjQXEd
         LehtjlgT3IcjJipEZufsZQZCCzgLnhiTNDz+TLvCNvtch0Dc+8S0x2qQubB2K34z9gN4
         SxBx5nPSrIwkFFGHmPhZ7XlMsEYwuMlK/XF84Xo5fv6dYYugkfrXwXbpw0moxtC3t+qD
         pdSqDSNr0xT4iXjPHJfOm3O6NaJoM9OrlKwBvEVmwhDQbLUM8wmoXkNNQL8gn+3Pne7R
         GcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792172005; x=1792776805;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pcz01RnH2iOdU3rzxvvGuaDXi6K+MOtLfDV1KCE4q94=;
        b=1u0IQFK9JPel/+Gcnp1Z9a5ZvqMgWIBuGNBta2gk5k0/APoAifr43+k9qs0wjiRfGk
         UTTrvFBSINL10JCwUiv0/YQOUH6tOrNCP+4OKcVFkV48QeZxrUMEFiIzR1iNCkNWZ2PW
         5bHr56N5stJ0BmgMKSWRToCYfUjauzSfS8fnhgXgN6LlwPJeMIMDGHSN+5eGAdjhl+CH
         5pr72YeVRELmpzZODbg+2yABQK0J7jWSi9MBMDL5fpL4pMHnMDnjdAB2wBgu3lRf0XTY
         5s3fNu0IS1ObU1FV8EIWBdgOesfDnq65p5xETjBY/sWqp/KVUfBYLygMrDMDI5yRoTUY
         rAxQ==
X-Gm-Message-State: AFq9FYKgqqG+SiY+Isgh5k08/p2u/Vdm6KevXLBKAE5V3hC6C8TpmLr/
	CwCqWLh5QDeAMe0vKaJb1hgmGJxW0d5PbU8AC46OhWD0OtuUbbj1DQ8P
X-Gm-Gg: AYBFou0GaMLTR02k8BRtCNyNKUqsVLZzaAIl74Xjk87lEbfHXhXbWQ+91M4888THlPF
	UyfFgkjtXkuGuXlinN0SOitRSfMNE82lrqu3g3JPvL8fQs7/7OWkaveHLHvvvN1OhxaHrRqnipu
	EY3p0909FbbutPpxG+RhVnecJ+EBhcWOL8u2bs2N1AmjZHhH14N/eNChBwptghBYYmVKc/R4QMe
	xwRVDjT8CD5AvFLDDbnKbNOxmc0iSx0KwepHeBcGXI/GA7MEqvSbfSn0RCsbUqmomqkXY+vRt4X
	oTmQevTLpCRE8f17TnXuui8NMH9GNfhHHS9zqgnyt3vmWUNI34DeibdxnesyauAVCZj1gVRIW6I
	WDpbPm8aHsJrBt6CXoI61s+2wJ68UgdPRqHyCVw9hVad8foStLF+3mCs+agviZ6JWBqFqVq99y4
	SJtLUwPpHDzy/66UULQTn6sWXlgNPwdyjiw+S64cxxVjBq77XZZXhB3oWp6p2Y2VBqpYRuTqJag
	doYP/D07bNG0Mk9YIPOzl4=
X-Received: by 2002:a05:6000:400e:b0:48d:dfff:fe6b with SMTP id ffacd0b85a97d-48e07f9aba7mr583819f8f.34.1792172005267;
        Fri, 16 Oct 2026 10:33:25 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f9c41sm6797068f8f.38.2026.10.16.10.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:33:24 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH 18/24] man/man7/unix.7: SCM_SECURITY: This is not specific to SELinux
Date: Fri, 16 Oct 2026 19:31:33 +0200
Message-ID: <20261016173139.13076-19-gnoack3000@gmail.com>
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

Reword the description of SCM_SECURITY to not be specific to SELinux.

The security context is populated in scm_passec() in linux.git
net/core/scm.c, through the security_secid_to_secctx() LSM hook, which
is currently implemented by SELinux, Smack and AppArmor.

Also clarify the properties of the returned string:

* There is no NAME_MAX limit on the length; SELinux contexts can be
  longer than that.  If the control buffer is too small, put_cmsg()
  truncates the data and sets MSG_CTRUNC.

* Whether the string is null-terminated also depends on the LSM:
  SELinux includes the null byte in the length, but smack_to_secctx()
  in security/smack/smack_lsm.c uses strlen() and doesn't.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    I reworded the LLM phrasing slightly and rewrote the commit message.
    
    I'm open for feedback about whether this is going into too much detail
    about the properties of the returned string.  Linux does indeed not
    guarantee that this terminates with a NUL byte, nor that NAME_MAX is
    large enough to hold it.

 man/man7/unix.7 | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 787a48baa97a..ff5a90863378 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -307,7 +307,7 @@ and returned as the result of
 is an integer boolean flag.
 .TP
 .B SO_PASSSEC
-Enables receiving of the SELinux security label of the peer socket
+Enables receiving of the security label of the peer socket
 in an ancillary message of type
 .B SCM_SECURITY
 (see below).
@@ -534,13 +534,26 @@ message, the
 option must be enabled on the socket.
 .TP
 .B SCM_SECURITY
-Receive the SELinux security context (the security label)
-of the peer socket.
-The received ancillary data is a null-terminated string containing
+Receive the security context (the security label)
+of the peer socket,
+as provided by the active Linux Security Module (LSM),
+such as SELinux or Smack.
+The received ancillary data is a string containing
 the security context.
-The receiver should allocate at least
+Whether the string includes a terminating null byte
+depends on the LSM;
+the length of the data is given by the
+.I cmsg_len
+field.
+There is no fixed limit on the length of the security context;
+allocating
 .B NAME_MAX
-bytes in the data portion of the ancillary message for this data.
+bytes in the data portion of the ancillary message
+is usually enough.
+If the buffer is too small,
+the data is truncated and the
+.B MSG_CTRUNC
+flag is set (see below).
 .IP
 To receive the security context, the
 .B SO_PASSSEC
-- 
2.56.0

