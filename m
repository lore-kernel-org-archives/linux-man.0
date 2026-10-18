Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C0A3D88F2
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 17:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345070; cv=none; b=dqcBqYXHnUllrbTLBZKMjXF7q1qGjRLPDsh+Xo7o98hhIZeia1EKqfxV2YAA1BAs7rWccRIDbJio5ySaggTKMNW22QrIbkEO1CtFxxnzc2vsxyrvd4YTv5nm13Q4L2uX/q4dIwvcP4Fuk8SIVdT2DL8qiXg28g9F7URAC9Fo0zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345070; c=relaxed/simple;
	bh=l3LaRO7ibKg7fqYCikyKWJlbdA/pZHAYbfYBrt0BNEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pyd+5T5BvDVKceGpiN6dbELVRShVYmwx/dFHxBfKptz2i83eLlIRzhtxuVAKVhM6d1Sxdb6qv7U+lIP4E4sob6voAjSr5Rfbp5RhPdWahh1MfOkBHc4XO+NUZgKtHsr0YUW50PyKh85XKIwoTy+fs9T62u0K1a9b6ujlDTDYKIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SemWEM2i; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SemWEM2i"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso12682515e9.2
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 10:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792345068; x=1792949868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xVYVnl+WhQAX5ZOvvyyHoZhSRZKPsKVO9ixpdM07WV4=;
        b=SemWEM2iV8hGJTdGAUs7IH8NZ3qxq4gx9sbjkP1ZLW0EjdnR+stDb4Ph7a6FQ/F9Sw
         lezDVDbUsexjU4kO8e9NlDCd03s7BczVewXgSOyLIUe2R/EFpRzcW9iETJUNl1DU8WD5
         oR9MsOIIBRtvodTnsR5J6/hM1V6eti2/BxcmBAFjqSNbUNfdNq0mvcFENexCE3SgGH3N
         RfiP8i7Qv4SFuAXlaTOdQFg8Bf/3BHo7WIGWl9rb9uAyrYh1r6uZuaZyu/jmJlZvl9x4
         1KYnzelr5i0wIm1gTuD46tL/jqmjyeUjIJJgNyIGRBctfsB+pq/N/CqKM4tJZkz/PTda
         OrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345068; x=1792949868;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xVYVnl+WhQAX5ZOvvyyHoZhSRZKPsKVO9ixpdM07WV4=;
        b=VUB8rvRE6Bf+b6GtyNJmBftNalNIDT4hBG5CegaelELGWsF2AqQQXQ27ELQ0+x8jvw
         r6Hrwojwg+ampqXpPRhz0XviGzkyJHS5sIGSWX1BBvClnvfJvVH9J0Ql+Ac9vIUYFrML
         f4taowrkKOMAT3ea004PKPZ6qV/SpKFBDnbAr24GebecznjNNi8lHlO6+lfvJVGg7KQa
         P9svLSpCrOIxFMEZFWN3GPQEYgAKVEbokEqG3eMhdrQhxs/Xq0+FEA5EPsB0LBBcDi5M
         uNUE4E+y7KFOE7JrAFjkYYMHJUVOb5dGak/a5v/RX0zlkHoFo2Dep/2xwoVAmIGR0w9a
         B5WA==
X-Gm-Message-State: AFq9FYK4p9AGRPDMkWs2gcV/I1jwAZjF8HjLAlbNB1PdQaw4T+IhnU5M
	ZbojYHkLz6+/smS1iGEDdjqDv+i0QYyqHPJ04ethICTJpdvhmCyZPc7n
X-Gm-Gg: AYBFou0kjfJr/M4vX6kVEJZv1JCXOWH/nNgnwEW/5I0AI+ec4zq6EHzslWOqGnogk83
	6Hvkgxa7wTcqILIPGxp6ZaiDu0h0CTChvu/wyEFtt4Kwwyf+BBGVzEw9e22knw9m7wSDG4JAFrf
	/sS2Q4jUEYfQXyUlEt+ZJAxCNE5zicwoqhLyRo6LA51gtzW3TJeNsfr6KrSQTJ24DbUMKFtJeQr
	A31PypabicDryNd7Fz1bwwq5wwwSF5HU1Jzviiz2kKMwN1hneoh3Xr4sh7GHD+VytuxcwRJhu0C
	HiOBvIMdbJlnLoiImmmms0jb99J2ds2U7y+JrbX792tvW8CuCYM8+pFBqE1F29dk4IFSJnpg3aT
	ANP475vQyW6aDpf7qGT1MenZyDHLVEiXtEIqgOmkimPpc4G8lJwh8HlY7BNgidNUeZzPFCCP7M4
	4mi4S8/qDZNvnGbCCBousxODj/Ao51BE2WrW8QTQLCTZBrir/Gn97eYGYn7/v4CneMq58Y2jjWo
	qlzxHeVGSULJ+LkuD924OI=
X-Received: by 2002:a05:600c:4684:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a1d76001e9mr111740575e9.16.1792345067465;
        Sun, 18 Oct 2026 10:37:47 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b8b5fsm339611705e9.9.2026.10.18.10.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:37:47 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Michael Kerrisk <mtk.manpages@gmail.com>
Subject: [PATCH v2 18/24] man/man7/unix.7: SCM_SECURITY: This is not specific to SELinux
Date: Sun, 18 Oct 2026 19:37:06 +0200
Message-ID: <20261018173712.27670-19-gnoack3000@gmail.com>
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

Fixes: ffad6a017f91 (2018-07-28; "unix.7: Document SCM_SECURITY ancillary data")
Cc: Michael Kerrisk <mtk.manpages@gmail.com>
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

