Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737343;
	b=PYYQj2ySrBMdgBzw00q+OkTnJ9YAEut7gjnZ2JOhWyT+TDlub+2bjN0bWcggNGNvaFRN
	 FUmZMDp03A+AdoAn/XbIbr8xrOBFsokg8hhl572JpzJ8NWk4VAFYJ1enM9xLF8Bcu9H7a
	 UK2KQ6yLkwV4+803GUj5uZnT4d/mT9pouMRhhEtclPWv5/FqytdBTF6xlqq/Xuc4Rbhhe
	 anb6eUD9kv8cy5kt1OgZlWGiKpR0cqApsS+b9Rb7VtQ/zgyUECQexWuRoxIbe1Hp5+D4l
	 qlODfX3T+YpopVh4pXw93v1PfIDFKymsGa4WrqKx9gmzgr12wst2m5HFe+dob4udIrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ymxevfIc/nOn5FYCb9hpMw5kQGiGepCWRbZacMP9tFw=;
	b=XPjQZNjv0joDqeSbXQjnlqzlYkF0ukCOPlDZ4iKySPaGJyhwFdMSOZb2ZMW+mtsRjgeJ
	 rhIC+mLBV53hKZoB8XmrjGrlvSFvLPZmPR9NYQWMnMdrAGHZtnpJg1H1W1xSTcybrvVGR
	 cc5ry3+BpzVk3Q+QwhC1QC1Vm6OXjoCFe3yIFjH8agz9T9DbqWhmvBY8l/nHgRn27vtMU
	 PPRUAPpb7SHuDNoaMcJ2YO4GzyIR922FRNELzQKsoked618ZwDlLP9AsVbEONPIrJuejO
	 eyq/tjkMJIcVnSVHXYP4CHewOnAhhYMvwstYMwqe/RsrvU598oV1mG+gLA84p69zdwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ku/3ixuV";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF15606A330
	for <linux-man@vger.kernel.org>; Tue,  3 Nov 2026 20:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EF15606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ku/3ixuV
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso33455165e9.2
        for <linux-man@vger.kernel.org>; Tue, 03 Nov 2026 12:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793737342; x=1794342142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ymxevfIc/nOn5FYCb9hpMw5kQGiGepCWRbZacMP9tFw=;
        b=ku/3ixuV3PjkP/aiFchEEk0ee+0egt279A2D3bO9o3zXiThO7eFOsj9w8MQ2/Ujdlx
         Z2ifeg2AMsVVQF7+0mXiCOArf34w8YPEXDVZgxZ0tswpDpHXLF6wzJuiGH9aLhBU5JQr
         EW91f18CoEaKj3fdPHUwFyL+80biGowWDZVgmcivvkNWxsjYJXkLyJNFSZD9C222oym4
         wOUSNhFT/g9vshYMdoDsILokmxlOWT5gVDFuj8xJ0zDiY5ZJHNzOz46OmMZL/GMoM2Qb
         nxQchCXBwOmEb5FjkdTh5rEXH42w1/zPZdiFBSqBFB2VALLqtKOBXRMdmLEzRhlMXdOf
         /bdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793737342; x=1794342142;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ymxevfIc/nOn5FYCb9hpMw5kQGiGepCWRbZacMP9tFw=;
        b=GWuco9FQ0ucMgv4FoVyk3JwvwCLgSIT9Hpj4XC/AD/W6hXjTOcEt61NIWSeoYy5XZA
         CPL438oSTERYmMQTEV7MwXYst5kvnW6cmKOjjoSZTPs42KSKRNS/jpjzvh6y0GYaM8O0
         VkwAxnrY3G1zZFGbl0cNJ81hZ2N5XFFX78F4avJOSA033sFypzpcAZn4z68QhaMe46kP
         x/bUBiy0RW1JTP5DbYxEa2NiBoDGKbNxJRsKLGbj2j2Du3mpQYsF4xsTRy/BSsvL3oEA
         78jVvoXHLkFy/jblGBeemp8sTbZ1oCvvu81f/oK/K4Ap1QDVyP7nfa26vWs70id7pwXf
         cxdg==
X-Forwarded-Encrypted: i=1; AKwUvBzIDQZpyA0873B8+sNxioZKIyePwkmgy6XYojOexqZzPqd2NxTrVc/+GNVPGm42LCb4BeEwklkosxw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ulx5Md6WNIzWIvXAfGBM31EKCjPFJIKvOclv1/r5chIJXmciy
	iOHjyYoaf+ZryPswVahtg37RtV5dLdixy0mK86jsuTY6mXGJTXt4WH50
X-Gm-Gg: AYBFou1fqRD6h1/i87gp0kvW1RMqiF6/1kkkEWt1CIm5VT8zdh0w0QpreTyXzyWNnab
	+0evk6KIrmev0QEJ5jrHbrx+xIEc5sjcVol/hzeUzpRS+fl+1WsjyYjLv41HvFw1XIKkl4dktNP
	1VybKRjTPPNQtkQG/OH8JiNo9z3UfHmElPy0kgjT3NEDHbydiwJEuPEi0PnT1snut6pM+FhArJe
	8oJ5W7M6RzxwOWBU94IKY6mnFh8buo/nKFVWRw1TQ1e5jRd5mbbD3ge1MsL6iYFg0SB8PveW2kw
	I4FqU7ji8rsRHA51JtrwvIwqc7utl7AWsVJlNnJGHVEACs2FabqiKefVTvFwvpNuVZE/DUUs4Eq
	3BlkY5GDtDB4XNiFrqrBFINrrjDXKdbifbG0rzDT0NS4eBbZ6qlGPX+Xq+Xw08E09yXq+yx1QDz
	UhXf8Io/5F0Bh4IgIuscEO8SCmspRC4pY2SNasqegCrKJ29QHgmboKVctg9vrnom//hxyToy7U8
	uCky5glQC7PsTHO0F6CvzMcD3ULdCgdsdFJa5GXLpFnoxQzR6baYu+d1y6WU52OZqzu5F++yL7+
	dVQ4YbAP3ao3D3PTQ0ez7r1AevE8880tFMhezjS3zsNoBS1FvwmOGQ==
X-Received: by 2002:a05:600c:138c:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4ac1765d3e8mr323903455e9.19.1793737341611;
        Tue, 03 Nov 2026 12:22:21 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b411de95b4sm4650815e9.0.2026.11.03.12.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:22:21 -0800 (PST)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org
Subject: [PATCH v2 0/8] unix.7: Socket Options and SCM_* fixes
Date: Tue,  3 Nov 2026 21:22:02 +0100
Message-ID: <20261103202211.13820-1-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Hello!

This is patch set (B) spun off from the "Documentation fixes in
unix(7)" patch set [1], which is now split into these three parts:

 (A) Miscellaneous fixes, mostly in unix.7, one in socket.7
 (B) Socket options and Socket-level Control Messages (SCM_*) <-- this one
 (C) sock_diag.7

This patch set fixes unix(7) documentation related to socket options
and SCM_* control messages.  The first 5 commits are fixes and factual
corrections, the last two commits are documenting two relevant new
features (PIDFD passing and SO_PASSRIGHTS).

The patch set is based on the "miscellaneous" patch set (A) ("General
Unix Domain Socket fixes"), since it is touching some error code
documentation in the same corner as what is getting changed in (A).

Thank you for your reviews of v1 and v2 of the still-joined patch set,
as well as of v1 of the split patch set.

Changes in v2 (split):

* Mention commit hashes in commit messages, not in groff comments
* Reword __scm_send() code snippet in commit message
* s/the last one takes effect/the last one is sent/
* Rewrite SCM_SECURITY section to be about byte buffers
  and independent of the LSM
* New commit:
  * Remove mentions of "namespace" in the general sense

Changes in v1 (split):

* Some commit message rewording (especially quoted the kernel code
  more directly).
* I removed the commit that changed the wording about Out-of-Band
  messaging, per Kuniyuki's suggestion in [2].
* The ETOOMANYREFS commit is a SCM_RIGHTS-specific error; the Autobind
  documentation change is included here because it refers to
  SO_PASSPIDFD.
* I am not 100% happy with how verbose the SCM_SECURITY change has
  become, but I don't see a good way to shorten it without cutting
  away from the substance.

v1: https://lore.kernel.org/all/20261021212256.27961-1-gnoack3000@gmail.com/

More details are attached in the commit notes.

This patch set has been produced with the help of a LLM, which was
helpful for spotting a long list of inaccuracies, comparing the
documentation with the kernel implementation.  (More details in [1])

–Günther

P.S.: Part (C) will come soon, but not today any more. :)
      That part is more independent again and, being about "sock_diag",
      it is outside of the main unix(7) documentation.


Günther Noack (8):
  man/man7/unix.7: ERRORS: ETOOMANYREFS: Fix the conditions
  man/man7/unix.7: Multiple same-typed SCM_* messages may be sent in one
    message
  man/man7/unix.7: Autobind: Clarify when it happens, and mention
    SO_PASSPIDFD
  man/man7/unix.7: SCM_SECURITY: Generalize to other LSMs, not just
    SELinux
  man/man7/unix.7: SO_PASSSEC: wfix
  man/man7/unix.7: Document SO_PASSPIDFD, SO_PEERPIDFD, and SCM_PIDFD
  man/man7/unix.7: Document SO_PASSRIGHTS
  man/man7/unix.7: Remove mentions of "namespace" in the general sense

 man/man7/unix.7 | 215 +++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 195 insertions(+), 20 deletions(-)

-- 
2.56.0

