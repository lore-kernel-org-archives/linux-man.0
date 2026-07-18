Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B3222FDE6
	for <linux-man@vger.kernel.org>; Sat, 18 Jul 2026 17:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784394168; cv=none; b=JA3pr+JIk0sItIYYiFG+r4IkQgJOaQ4uwxivyg2Cd2BVct8WmQauNvhWQCtA9ZJoGMdkmTD70Hd1lRYyGXOhZnJuWDb/YUx0l/YlDqQHUaFv0uCc/+6baxeUftqeL3a1Fv91eeFrDnCLlpXMuoF7oKO7vKPkwZzRt66xns0RcIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784394168; c=relaxed/simple;
	bh=csEf9kLIJKHrqwxJVrYmyuj0Q3rpDWeFinB1m+Fwv7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j/VK3WKJMpUFrZh+u29YtwF3idFSeGrgjvakz+DbPZlnOuYjhrMxaXkIAGZnkpR02ck7gtQi/8v+femMvTqhnqCirGzEJ8SSA5RwFcrzqtjhhv7NBXdchrUL+dmTa1BpAyNwcJcCkSQUdL53nQGDW8WiMJ0yw9ssbAlUxZ/eR3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draigBrady.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJW4F+aX; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draigBrady.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJW4F+aX"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47df6a5202bso6055615f8f.0
        for <linux-man@vger.kernel.org>; Sat, 18 Jul 2026 10:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784394165; x=1784998965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nxf4yhkznDUvhQuf9Af9U7405TKmSRz13eDHHrERcwk=;
        b=eJW4F+aXRPZ54AGj5YPcqVrGdRsljmqk4uGtZcfYdIWn9v9+pPA4vssmNcS3ffjRkX
         yCI20OnGZ5Gqr48gm+FBoG+cFKcGRq8sKx0F3JWaEEJB3jwMHJ3p3tZcsQYiiEmF0qdC
         D5deooGhOAStJ3XH5214y+YViMWtRnxelFDwA2RCHbo3YJRwbFnrnWbbeEC6ghVRv9em
         wkmA+DpiDAOkGANz1jWxcTpxpXZpzwbVCmkELR6WTco4M4vYQSGgBE0u6hVDrYBgvyd/
         RMbqxNSOCMffGJsioNKaJsN3KpUTpGxwZJ2O0opVjsbKslqBkc/I/vUWO4HlxXqMeWsf
         gAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784394165; x=1784998965;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nxf4yhkznDUvhQuf9Af9U7405TKmSRz13eDHHrERcwk=;
        b=QGZrbni2NXVVhVGaItQk3BEJXKHK+2c9NkYrLq0xFZzzTn5syX3xi3zG9ChoeeretO
         gyXzLrnbV6HdAabfJQDrSaHa7n5/8S5TiMIpeCsCKkDrexhOjP2aV2QEer0eGmvGSv5O
         pJ/RY+iocF3uWwDAANSgwxXyZHfNLRyYGoF91mmDUQXEpl4xsGiXLuOrez6QLDgdrkaJ
         WdvvSwHMI2SGhOIb82NsI7cTvhQH9PYuMMcXxcBlWwefrlfnii0D0mazWPRFEDww8cN3
         ost5vxfGHZbZ3/5B7mLQjDcA+hZGj3Wi0098G7ebpsZT8kBtytjZS40K6WOnhJjFLPsz
         n5Zw==
X-Gm-Message-State: AOJu0Yw6jmDT++Y0iSwOaYQLzvXdqSx37L7xDh90ljlEvR7HF9K9a0Np
	k4tQao0o2gRMP+w6VH+yb4+lhwXLMp0ovvbbMXqe04ydqQ2vI0q2NxQwNiixEQ==
X-Gm-Gg: AfdE7clWKwAXI4acuN6Mbdj8b6kMn40S+8VJcSTurUXEUP02OMiOAbCgyW/Oq2Jkcbz
	qezS0hjhndzUa14yUuRH2oCRBvcQIk6FIq310ndykLDXcKC+oZl6fq206txC0mIpouslfvIQo52
	vCSZiBFSny2W6DKN9C0YEa2XFZFCYbReEsbL9j93F4vtEGrXhZkLfKP24bTDMXR6zDLdx3ptO4a
	WJocX63lt0QQsPKI3bpod+cyMEs+QqrEbFW1NUwk08u5tiTaF7mP3GlQVzxz8u6SJQr9xJ9p2rd
	3IB0+FyAUOy9C1WT7X7bzWrAgdT9JDIHeDcCjVgAGPNZo/EXlr9GU3OrQx1PpYXqp0mbyoWhEsF
	6Ie7iyFMdSnYgCTzaR+KUqEvlOfM3vyP9mEy87rwww47IBHAKw9RdfdV0CJxCsigQDZJJI7BtNO
	ypSbTp5epOSs+TkZVwBIwckK/jAp78ijnMRp38Rr+komgo0xmcuSemsA==
X-Received: by 2002:a05:6000:4310:b0:46f:7d90:8114 with SMTP id ffacd0b85a97d-47f62305bedmr9289637f8f.14.1784394164496;
        Sat, 18 Jul 2026 10:02:44 -0700 (PDT)
Received: from [192.168.1.31] (86-44-210-62-dynamic.agg2.lod.rsl-rtd.eircom.net. [86.44.210.62])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f63e51986sm15612463f8f.11.2026.07.18.10.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jul 2026 10:02:43 -0700 (PDT)
Sender: =?UTF-8?Q?P=C3=A1draig_Brady?= <pixelbeat@gmail.com>
Message-ID: <9d03b838-eec1-499b-a55f-047cc7e2ef92@draigBrady.com>
Date: Sat, 18 Jul 2026 18:02:43 +0100
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: Hand-written manual pages for GNU coreutils
To: Alejandro Colomar <alx@kernel.org>, coreutils@gnu.org
Cc: linux-man@vger.kernel.org
References: <aluIbrKBtAxweITC@devuan>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A1draig_Brady?= <P@draigBrady.com>
In-Reply-To: <aluIbrKBtAxweITC@devuan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/07/2026 16:13, Alejandro Colomar wrote:
> Hi!
> 
> I've started working on improving the quality of the manual pages for
> coreutils, as I promised some time ago I'd do.  The work is --for the
> moment-- in the 'coreutils' branch of the Linux man-pages repo.  Once
> I finish, they won't be auto-generated from --help anymore.
> 
> <https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/log/?h=coreutils>
> 
> We'll talk about incorporation to the coreutils.git repo later.

For reference, it was previously discussed at:https://lists.gnu.org/archive/html/coreutils/2025-09/msg00151.html
For clarifications on any details, please see the full documentation
for any command at the link at the bottom of the coreutils man page.

E.g. `man vdir` references https://www.gnu.org/software/coreutils/vdir

Also note that since v9.10 each coreutils man page has deep links
from each option in the man page to the corresponding description
in the full documentation.  That is something that could be maintained
in any forked man pages.

cheers,
Padraig
