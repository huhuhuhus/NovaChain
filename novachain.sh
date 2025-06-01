# 更新 apt 软件包列表，并安装一些必要的开发工具
sudo apt update && sudo apt install git curl nano python3 build-essential gcc libc6-dev figlet -y && \

# 安装 Rust 开发环境（默认配置，全自动安装）
curl https://sh.rustup.rs -sSf | sh -s -- -y && \

# 让当前 shell 会话加载 Rust 环境变量（启用 cargo 等命令）
source $HOME/.cargo/env && \

# 使用 figlet 打印居中、大字体的 “SAINT KHEN” 字样
figlet -c -w 120 "SAINT KHEN" && \

# 打印 Twitter 信息
echo -e "\nFollow on Twitter: @admirkhen\n" && \

# 从 GitHub 克隆 party_cli 仓库（一个 Rust 项目）
git clone https://github.com/wyattbenno777/party_cli && \

# 进入该项目目录
cd party_cli && \

# 创建一个名为 yourfile.wat 的 WAT（WebAssembly Text Format）文件，内容是递归的 Fibonacci 函数
echo '(module

  (func $fib (param $n i32) (result i32)

    (if (result i32)

      (i32.lt_s (local.get $n) (i32.const 2))

      (then (i32.const 1))

      (else

        (i32.add

          (call $fib (i32.sub (local.get $n) (i32.const 1)))

          (call $fib (i32.sub (local.get $n) (i32.const 2)))

        )

      )

    )

  )

  (export "fib" (func $fib))

)' > yourfile.wat && \

# 构建 Rust 项目（生成 release 模式的二进制）
cargo build --release && \

# 再次打印 “SAINT KHEN” 字样
figlet -c -w 120 "SAINT KHEN" && \

# 使用构建好的 party_cli 工具，执行刚才写入的 yourfile.wat 文件
./target/release/party_cli --wat yourfile.wat && \

# 进入生成的 proofs 目录
cd proofs && \

# 启动一个 Python 的简易 HTTP 服务，监听 8080 端口，用于访问生成的证明文件等
python3 -m http.server 8080
