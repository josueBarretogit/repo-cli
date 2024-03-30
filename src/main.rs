use core::panic;
use std::error::Error;
use std::process;

use clap::Parser;

use std::fs::OpenOptions;
use std::io::Write;

#[derive(Parser)]
struct CliParameters {
    #[arg(short = 'a', long = "alias")]
    alias: String,
    #[arg(short = 'p', long = "path")]
    path: std::path::PathBuf,
}


fn main() -> Result<(), Box<dyn Error>>{

    let parameters = CliParameters::parse();


    let path_to_repos = std::env::var("PATH_REPOS").unwrap_or_else(|err| panic!("Could not find env variable: \n {err}"));

    
    let result = update_repos(parameters, path_to_repos).unwrap_or_else(|err| panic!("An error ocurred when updating repos, details: \n{err}"));

    println!("{result}");

    process::exit(1);

}


fn update_repos(params : CliParameters, path_to_repos : String) -> Result<String, Box<dyn Error>>{

    let path_to_file = match params.path.to_str() {
        Some(path) => path,
        None => return  Err("path was not passed".into())
    };


    match OpenOptions::new().append(true).open(path_to_repos) {

        Ok(mut file_handler) => {
            if let Err(e) = write!(file_handler, " \"{}\", \"{}\" \n", params.alias, path_to_file) {
                return  Err(e.into());
            };
            return Ok("Repos where successfully updated".to_string())
        },
        Err(e) => {
            eprintln!("Could not open file to repos, check the path to that file");
            return Err(e.into())
        }
    };
}
