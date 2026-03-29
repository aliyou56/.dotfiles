local ls  = require("luasnip")
local s   = ls.snippet
local t   = ls.text_node
local i   = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {

  -- Boilerplate ──────────────────────────────────────────────────────────
  s("main", fmt([[
    fn main() {{
        {}
    }}
  ]], { i(0) })),

  s("amain", fmt([[
    #[tokio::main]
    async fn main() -> Result<(), Box<dyn std::error::Error>> {{
        {}
        Ok(())
    }}
  ]], { i(0) })),

  -- Functions ────────────────────────────────────────────────────────────
  s("fn", fmt([[
    fn {}({}) -> {} {{
        {}
    }}
  ]], { i(1, "name"), i(2), i(3, "()"), i(0) })),

  s("afn", fmt([[
    async fn {}({}) -> {} {{
        {}
    }}
  ]], { i(1, "name"), i(2), i(3, "Result<()>"), i(0) })),

  s("pfn", fmt([[
    pub fn {}({}) -> {} {{
        {}
    }}
  ]], { i(1, "name"), i(2), i(3, "()"), i(0) })),

  s("pafn", fmt([[
    pub async fn {}({}) -> {} {{
        {}
    }}
  ]], { i(1, "name"), i(2), i(3, "Result<()>"), i(0) })),

  -- Structs & enums ──────────────────────────────────────────────────────
  s("st", fmt([[
    #[derive(Debug)]
    pub struct {} {{
        {},
    }}
  ]], { i(1, "Name"), i(0) })),

  s("stf", fmt([[
    #[derive(Debug, Clone, PartialEq)]
    pub struct {} {{
        pub {}: {},
    }}
  ]], { i(1, "Name"), i(2, "field"), i(3, "Type") })),

  s("en", fmt([[
    #[derive(Debug, Clone, PartialEq)]
    pub enum {} {{
        {},
    }}
  ]], { i(1, "Name"), i(0) })),

  s("impl", fmt([[
    impl {} {{
        pub fn new({}) -> Self {{
            Self {{ {} }}
        }}

        {}
    }}
  ]], { i(1, "Name"), i(2), i(3), i(0) })),

  s("impltr", fmt([[
    impl {} for {} {{
        {}
    }}
  ]], { i(1, "Trait"), i(2, "Type"), i(0) })),

  -- Error handling ───────────────────────────────────────────────────────
  s("res", fmt([[Result<{}, {}>]], { i(1, "T"), i(2, "E") })),
  s("opt", fmt([[Option<{}>]],     { i(1, "T") })),

  s("qm",  fmt([[
    let {} = {}?;
  ]], { i(1, "val"), i(2) })),

  s("mat", fmt([[
    match {} {{
        Ok({})  => {},
        Err({}) => {},
    }}
  ]], { i(1), i(2, "val"), i(3), i(4, "e"), i(0) })),

  s("iferr", fmt([[
    if let Err({}) = {} {{
        {}
    }}
  ]], { i(1, "e"), i(2), i(0) })),

  s("iflet", fmt([[
    if let Some({}) = {} {{
        {}
    }}
  ]], { i(1, "val"), i(2), i(0) })),

  s("wlet", fmt([[
    while let Some({}) = {} {{
        {}
    }}
  ]], { i(1, "val"), i(2), i(0) })),

  -- Traits & generics ────────────────────────────────────────────────────
  s("tr", fmt([[
    pub trait {} {{
        fn {}(&self) -> {};
    }}
  ]], { i(1, "Name"), i(2, "method"), i(3, "()") })),

  s("derive", fmt([[
    #[derive({})]
  ]], { i(1, "Debug, Clone, PartialEq") })),

  s("gen", fmt([[
    fn {}<{}: {}>({}) -> {} {{
        {}
    }}
  ]], { i(1, "name"), i(2, "T"), i(3, "Clone"), i(4), i(5, "T"), i(0) })),

  -- Testing ──────────────────────────────────────────────────────────────
  s("test", fmt([[
    #[test]
    fn test_{}() {{
        // Arrange
        {}
        // Act

        // Assert
        assert_eq!({}, {});
    }}
  ]], { i(1, "feature"), i(2), i(3), i(4) })),

  s("atest", fmt([[
    #[tokio::test]
    async fn test_{}() {{
        {}
    }}
  ]], { i(1, "feature"), i(0) })),

  s("tmod", fmt([[
    #[cfg(test)]
    mod tests {{
        use super::*;

        #[test]
        fn test_{}() {{
            {}
        }}
    }}
  ]], { i(1, "feature"), i(0) })),

  -- Closures & iterators ─────────────────────────────────────────────────
  s("cl",  fmt([[|{}| {}]], { i(1), i(0) })),
  s("clm", fmt([[|{}| {{ {} }}]], { i(1), i(0) })),

  s("map",    fmt([[.map(|{}| {})]], { i(1, "x"), i(0) })),
  s("filter", fmt([[.filter(|{}| {})]], { i(1, "x"), i(0) })),
  s("fold",   fmt([[.fold({}, |{}, {}| {})]], { i(1, "0"), i(2, "acc"), i(3, "x"), i(0) })),

  -- Macros & printing ────────────────────────────────────────────────────
  s("pr",   fmt([[println!("{}", {});]], { i(1, "{}"), i(2) })),
  -- s("prd",  fmt([[println!("{:?}", {});]], { i(1) })),
  -- s("prp",  fmt([[println!("{:#?}", {});]], { i(1) })),
  s("ep",   fmt([[eprintln!("{}", {});]], { i(1, "{}"), i(2) })),
  s("todo", t([[todo!()]])),
  s("unimpl", t([[unimplemented!()]])),

  -- Common imports ───────────────────────────────────────────────────────
  s("use",   fmt([[use {}::{};]], { i(1), i(2) })),
  s("useas", fmt([[use {} as {};]], { i(1), i(2) })),
}
