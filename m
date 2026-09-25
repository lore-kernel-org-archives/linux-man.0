Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602B0483BC6
	for <linux-man@vger.kernel.org>; Fri, 25 Sep 2026 17:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790357086; cv=none; b=mrWR3z+En9CyX7/RUmbjcc/JNSgGVXa3yxtiNqepoC+Wx7r8Lki0K2FZYQUgqFFRmzLSIzWz9IAbPG8avaTsJh04FIH61ge1jawVF4GrEPJh2J6w3pZxyd01xdiQexTCQrariW1K0bJmik7al+5WkVHPBr8VgYF54haYWbLAYp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790357086; c=relaxed/simple;
	bh=fvHZzDskk7v8po+/mEGcgbeYaav8EksZCcn7KJqF0yA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qaG6guUm8+zAC3HsTGbgJn1Cw9OFJqAYhTPjQh3dW3JUbJA4r3YhJkr6CR0r0nk/D/2Y84fGZM2152CZuwT3duoVzTzwSQgMtCQ+PVKVrwKqCeVAHVu7EZXnUYBUdJ8xbQjZ1RtjfEQKXdUXTdYn2XxmeFV++gYydsEXY+kB99k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIXTwzIb; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIXTwzIb"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939695b5741so110886685a.1
        for <linux-man@vger.kernel.org>; Fri, 25 Sep 2026 10:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790357083; x=1790961883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gODMPbHUvL+X4VsBZGbFZufIr6Cdjo1EClW7N7ND5p4=;
        b=hIXTwzIbzGEfV77sS/beRfvhrZvjIStDxVLBzxNhtdpfpsShBv6/XY1pfVuj2AdMC7
         Arxg0slicQsR9CmDZQnEjHxaM1mgV6Mxw4d75Qu3KyCyKoJ00KX6lZ3dtCMHcZuIxaTW
         fPaX4XHXSEw/9Vv5DNj3KiGhTebMFdioChaJLMSetxsYeCA9yvQBS6iBaxuuY1V0rxUw
         hgWfewXK0fP/B6XhngpXBlsd91qvteiRrN+mu1GJm/AGDnSk5sa8b79M50mO2Sn1HLkN
         Kc8r9tXKwfeORlq2+21fy5U1XYqBJ19GabRaKPmkXxw4fqPMfswtSyNQeHBTDhR1uFTb
         RTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790357083; x=1790961883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gODMPbHUvL+X4VsBZGbFZufIr6Cdjo1EClW7N7ND5p4=;
        b=hPOVSENM+Hmdbqp6rMHZCF6OPoeANpr6YvfU4JyHSE6SItlr4SFPD+0ODKCE4t1NTf
         CY0K+6m2TW8pcJ6OHGnuZ8R6uNRjqpumGVvi/yY5nfTGDf0nVe6fXt8e1WQDCr9bjM6u
         zuUhLNqbvMcMXwPIE2jHW8EiDgFrpqOrr9rIDNS5gIkvLN6k/IrecB44ZiingJqgZaOL
         /zOxn6vJ8XxhA68RzJTZjcePIxlkYkAaFh7rWjna0YjK8eAWFVMCbKAyQ8DFDhKQWfR1
         m4xBZCsw49IeBqIxn72D2h9tZ6H/bz1/sJ6QXAO9CxRB2RYC48i5xwY2Ep8PJIjHwbDf
         N7Ig==
X-Gm-Message-State: AFuF++nkD8iaeG9JjHOsDiNvi1i2Nr7W8nHfDcua9c/vFwt9PLpq9au+
	Q6Vek8xbgpd8WY1w5T6/OrezsOb/ZayyFFFBBcJxY2O8/4LTLGfTmheaB2HeljFB
X-Gm-Gg: AYBFou25QwFyf/qB00/JfCYx+0uB5FODUqoBkyVeB24kjqUkMqPm8Rs/XFuySNZswx9
	VdKhjj4W9XCDGDeWDhFAAaQw4mLzFVNTWPpmpHIhfDXfXdFg4sr1X185Mx8QLYrUEeKl7+0rC6c
	UtCbylMJa6O6ZRr9jSQAugXVHkVfjBfHcIYiRMmz5HOM8EgAvtHdzxFfSyU9wXecnHGviBAYy6e
	pbU39fP8VKWCuPJnR96IUa2oR3c9Xoms+oDa0IuxEBB+yMXKUPrSisbKOW9iZt3QmhIm5QVGf3V
	pyvPkY9IUJob6qzwFs6YR4Kbo/hkCbnxkc8vaot8dAqUDJhxOpbhXrh3s0l0pNxFhMYFqUl81Eg
	etGwU3KTgw9YI0xiyhrCThbEMVApnwerHL5xSRuYOstfZsMAa42YJTIYsovfAZFadi1TdFwRfKE
	M19UEwUXeYyRllMGDwBmAwbh4e1rhq9Pori8hzR+n9MKqy+ci8YQVMN133FMs0bAPYHJfzjFzV4
	P83xKNy1wRgI5X7LNWTvxNybyrEC4Kb3FJDS/MqWObGs5T3VFFxcSxi9cCoZ7h3z72BbMNMmIXe
	2EVRoyQ=
X-Received: by 2002:a05:620a:284b:b0:93b:e6d3:3145 with SMTP id af79cd13be357-93c43d42079mr590223685a.64.1790357083005;
        Fri, 25 Sep 2026 10:24:43 -0700 (PDT)
Received: from str-mac-5701 ([2601:140:9000:ea70:398b:ef19:5908:7be0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c448ae879sm228738585a.13.2026.09.25.10.24.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Sep 2026 10:24:42 -0700 (PDT)
From: Ethan Ferguson <ethanf108@gmail.com>
X-Google-Original-From: Ethan Ferguson <ethan.ferguson@str.us>
To: alx@kernel.org
Cc: linux-man@vger.kernel.org,
	Ethan Ferguson <ethanf108@gmail.com>
Subject: [PATCH] Changed wording in userfaultfd.2
Date: Fri, 25 Sep 2026 13:24:40 -0400
Message-ID: <20260925172440.24358-1-ethan.ferguson@str.us>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ethan Ferguson <ethanf108@gmail.com>

A fourth userfaultfd mode was added in commit aa7589c9ffce, but this
wording wasn't changed.

Signed-off-by: Ethan Ferguson <ethanf108@gmail.com>

---
 man/man2/userfaultfd.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man2/userfaultfd.2 b/man/man2/userfaultfd.2
index 23ae53890..c765b64c0 100644
--- a/man/man2/userfaultfd.2
+++ b/man/man2/userfaultfd.2
@@ -75,7 +75,7 @@ all memory ranges that were registered with the object are unregistered
 and unread events are flushed.
 .\"
 .P
-Userfaultfd supports three modes of registration:
+Userfaultfd supports four modes of registration:
 .TP
 .BR UFFDIO_REGISTER_MODE_MISSING " (since Linux 4.10)"
 When registered with

base-commit: 227f4c2fd6c421ad8e4f81ccf1acad1a139fe3a7
-- 
2.55.0

