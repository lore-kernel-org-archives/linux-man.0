Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE67337F730
	for <linux-man@vger.kernel.org>; Fri, 10 Apr 2026 16:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775839956; cv=none; b=Chcfk6/wk4RdPQiZsr0uEhJ6jB5OxU6JEprAZTEwhlynEafKiWV9hZ82v3so8oZmotdhsXhueaLp39CF7UHoPjk27k8yyWTlIHoBElXp9CljJc24eSrGIv4CkAhAgXWoLRzEwlvtofa8KET/5s1bWV+yRFasZXVp4Lw6Y3evfKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775839956; c=relaxed/simple;
	bh=Nkhlpq6QiZKowfRt0eRqt3itcQYzzYOkwZDp4lzc8vU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=LBLChT2hmV9svRLHoCvsU+KkSrYsGW2kgYZO0UwaF8ldMRo5Enae3kt/u+etQPKogKelnpbOVpmZM79oHnzdG7ZJWPUkcpHTs45wMvab36MvjgvGuPJ8QPbeW1gbthAdvMDSfDaFuUx4IAKXYZEMUwjtAlH8BsdKpCyEWkDfyGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ItI703tL; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ItI703tL"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fsjXG1qJSz9tf6;
	Fri, 10 Apr 2026 18:52:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1775839950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=Nkhlpq6QiZKowfRt0eRqt3itcQYzzYOkwZDp4lzc8vU=;
	b=ItI703tL/eQerweGpBgJzljpgAkiSOMNYtP7QpR2QD3uDoSZXTh4o56307jFkgGBzPdHQm
	+Rm7DZgYHTldXoEm375KB7DKmLrqO7zq5GC9poKRQ+EqdwE0ticZTjHwDoEjQOu6I6ziUm
	h/LDoYEZhg1+zWLKVhnbhCS0D8JEY11BCGun9tQHq145xRB1Za+hXMXAxn+/Oeg/lRJ/ri
	9qJco72pkW/hWVN9J2D3HY5KHppZW8y8HB5gdeZPUYp+XiygLb8Ycyl2QYXv/rAqQnhsNN
	bSgYY547EKI5IyYWbDhZ1ua+BG//+Xm6OGLnSU2g+1PT8tg2djGAK1cR/+X+Tg==
Message-ID: <e53daaf2-3658-4645-ba29-fa488bec5ed8@mailbox.org>
Date: Fri, 10 Apr 2026 18:52:29 +0200
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US
From: Zeno Endemann <zeno.endemann@mailbox.org>
Subject: Missing error values in ftruncate and fallocate man pages?
Autocrypt: addr=zeno.endemann@mailbox.org; keydata=
 xjMEaQTnsRYJKwYBBAHaRw8BAQdAaM0iP7BM4cim48CUrxLA/GL1pYCCEzcWwMWZpif6rNXN
 M1plbm8gU2ViYXN0aWFuIEVuZGVtYW5uIDx6ZW5vLmVuZGVtYW5uQG1haWxib3gub3JnPsKW
 BBMWCgA+FiEEmC5dRIssSc8usW9ctw5fyLMNvKkFAmkE57ECGwMFCQWjmoAFCwkIBwIGFQoJ
 CAsCBBYCAwECHgECF4AACgkQtw5fyLMNvKlmYgD+LcbsvEZxyegeAcyvZXvpZBEjHXqkdM90
 C9QVC1CsW3IA/jqxTNUPJZ26XR3/d7XcWMFg5JRZyJdL7dP+7crJeMkGzjgEaQTnsRIKKwYB
 BAGXVQEFAQEHQHFzaxdORLfIxXTm1tjSnTbboFXL9tw5GgcNA4Nz0AQiAwEIB8J+BBgWCgAm
 FiEEmC5dRIssSc8usW9ctw5fyLMNvKkFAmkE57ECGwwFCQWjmoAACgkQtw5fyLMNvKmYmgEA
 xY2IpTWenWoXXSyhGUWu/ZfdRUsUBtYM5wSj7XeayCUA/0/dEWSKHsuxuFgvaetZE92+qjb8
 HkxusIwKIh1rafYI
To: alx@kernel.org
Cc: linux-man@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 7nf8qk6djnq55af86g4ttf9zpfnbxc5q
X-MBO-RS-ID: 35b5db33c9b2f1972f5

Hello,

I noticed that the man page for truncate(2) does not list the error codes
ENOSPC and EDQUOT, but I would think those should be potentially possible
when actually expanding a file (may depend on file system?).

Similarly, fallocate(2) also does not list EDQUOT (ENOSPC is there however).
Finally, posix_fallocate(3) has no EDQUOT as well, and EIO also seems to be
missing for this one.

Or am I overlooking something?

Thanks,
Zeno Endemann


